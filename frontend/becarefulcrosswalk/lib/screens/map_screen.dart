import 'dart:async';
import 'dart:developer';

import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:becarefulcrosswalk/widgets/prompt_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:poly_geofence_service/poly_geofence_service.dart';
import 'package:provider/provider.dart';

import '../models/intersection_model.dart';
import '../provider/my_location_state.dart';
import '../service/api_service.dart';
import '../service/my_location.dart';

class MapScreen extends StatefulWidget {
  final GeofenceService geofenceService;

  const MapScreen({super.key, required this.geofenceService});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final GeofenceService _geofenceService;
  late final Completer<NaverMapController> mapControllerCompleter;
  late final MyLocation myLocation;
  late Future<void> initializationFuture;
  late final PolyGeofenceService _polyGeofenceService;

  @override
  void initState() {
    super.initState();
    _geofenceService = widget.geofenceService;
    myLocation = MyLocation();
    mapControllerCompleter = Completer<NaverMapController>();
    _geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
    _geofenceService.start();
  }

  // Future<void> _initGeofenceService() async {
  //   _geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
  //   try {
  //     if (Provider.of<MyLocationState>(context, listen: false)
  //             .myLocationState ==
  //         1) {
  //       var geoId =
  //           Provider.of<MyLocationState>(context, listen: false).geofenceId;
  //       log('나 이미 들어와있어!!!!!!!!!!@@@@@@@@@@@@@@@');
  //     }
  //     await _geofenceService.start();
  //   } catch (e) {
  //     print('Error starting geofence service: $e');
  //   }
  // }

  Future<void> _onGeofenceStatusChanged(
      Geofence geofence,
      GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus,
      Location location) async {
    setState(() {
      if (geofenceStatus == GeofenceStatus.ENTER) {
        print('@@@@@@@@@@@@@@@@@@@@${geofence.id}에 들어옴@@@@@@@@@@@@@@@@@@@@@');
        Provider.of<MyLocationState>(context, listen: false)
            .setMyLocationState(1); // 내 위치상태 원 안
        Provider.of<MyLocationState>(context, listen: false)
            .setGeofenceId(geofence.id);
      } else if (geofenceStatus == GeofenceStatus.EXIT) {
        print('${geofence.id}에 나감');
        Provider.of<MyLocationState>(context, listen: false)
            .setMyLocationState(0); // 내 위치상태 원 밖
        Provider.of<MyLocationState>(context, listen: false).setGeofenceId('0');
      }
    });

    if (Provider.of<MyLocationState>(context, listen: false).myLocationState ==
        1) {
      // 원안에 들어오면
      IntersectionModel intersection =
          await ApiService.getIntersection(int.parse(geofence.id));
      log("api요청 완료했어");
      await _initPolyGeofenceService(); // PolyGeofence 초기화

      for (Crosswalk crosswalk in intersection.crosswalkList) {
        log('교차로 아이디: ${crosswalk.crosswalkId}');
        _polyGeofenceService.addPolyGeofence(
          PolyGeofence(
            id: '${crosswalk.crosswalkId}',
            data: {"crosswalk": crosswalk, "geofenceId": geofence.id},
            polygon: <LatLng>[
              LatLng(double.parse(crosswalk.coordinateList[0].latitude),
                  double.parse(crosswalk.coordinateList[0].longitude)),
              LatLng(double.parse(crosswalk.coordinateList[1].latitude),
                  double.parse(crosswalk.coordinateList[1].longitude)),
              LatLng(double.parse(crosswalk.coordinateList[2].latitude),
                  double.parse(crosswalk.coordinateList[2].longitude)),
              LatLng(double.parse(crosswalk.coordinateList[3].latitude),
                  double.parse(crosswalk.coordinateList[3].longitude)),
            ],
          ),
        );
        log("끝~!!@");
      }
    }
  }

  Future<void> _initPolyGeofenceService() async {
    _polyGeofenceService = PolyGeofenceService.instance.setup(
        interval: 5000,
        accuracy: 100,
        loiteringDelayMs: 60000,
        statusChangeDelayMs: 10000,
        allowMockLocations: false,
        printDevLog: false);
    _polyGeofenceService
        .addPolyGeofenceStatusChangeListener(_onPolyGeofenceStatusChanged);

    try {
      await _polyGeofenceService.start();
      log("poly만들어짐");
    } catch (e) {
      print('Error starting polygeofence service: $e');
    }
  }

  Future<void> _onPolyGeofenceStatusChanged(PolyGeofence polyGeofence,
      PolyGeofenceStatus polyGeofenceStatus, Location location) async {
    setState(() {
      // 횡단보도 직사각형 지오펜스에 들어왔을때
      if (polyGeofenceStatus == PolyGeofenceStatus.ENTER) {
        log("@@@@@@@@@@@@@@@횡단보도에 들어왔어@@@@@@@@@@@");
        polyGeofence.data.crosswalk.Provider
            .of<MyLocationState>(context, listen: false)
            .setMyLocationState(2); // 위치상태 횡단보도 안
        Provider.of<MyLocationState>(context, listen: false)
            .setGeofenceId(polyGeofence.id);
        if (Provider.of<MyLocationState>(context).myLocationState == 2) {}
      } else if (polyGeofenceStatus == PolyGeofenceStatus.EXIT) {
        Provider.of<MyLocationState>(context, listen: false)
            .setMyLocationState(1); // 원 안
        Provider.of<MyLocationState>(context, listen: false)
            .setGeofenceId(polyGeofence.data.geofenceId);
        print('횡단보도 나감');
      }
    });
  }

  // locationState에 따른 메시지를 반환하는 함수
  String getPromptMessage() {
    switch (Provider.of<MyLocationState>(context).myLocationState) {
      case 1:
        return '반경 20미터 이내에 보행자 신호등이 있습니다.';
      case 2:
        return '직사각형 안에 보행자 신호가 있습니다.';
      case 3:
        return '신호등 건너는 중입니다.';
      default:
        return '반경 20미터 이내에 보행자 신호등이 없습니다.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Semantics(
          label: '실시간 신호정보',
          child: const Text(
            '실시간 신호정보',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          PromptWidget(message: getPromptMessage()),
          Expanded(
              child: NaverMap(
            options: NaverMapViewOptions(
              initialCameraPosition: NCameraPosition(
                  target: NLatLng(myLocation.latitude, myLocation.longitude),
                  zoom: 17,
                  bearing: 0,
                  tilt: 0),
              indoorEnable: true,
              // 실내 맵 사용 가능 여부
              locationButtonEnable: true,
              // 위치 버튼 표시 여부
              consumeSymbolTapEvents: true,
              // 심볼 탭 이벤트 소비 여부
              scrollGesturesEnable: false,
              // 스크롤 제스처 비활성화
              zoomGesturesEnable: false,
              // 확대/축소 제스처 비활성화
              rotationGesturesEnable: false,
              // 회전 제스처 비활성화
              tiltGesturesEnable: false,
              // 기울기 제스처 비활성화
            ),
            onMapReady: (controller) {
              mapControllerCompleter.complete(controller);
              controller.setLocationTrackingMode(NLocationTrackingMode.face);
              log("onMapReady", name: "onMapReady");
            },
          )),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  @override
  void dispose() {
    _geofenceService.stop();
    super.dispose();
  }
}
