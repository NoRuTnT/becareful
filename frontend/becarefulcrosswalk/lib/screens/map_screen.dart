import 'dart:async';
import 'dart:developer';

import 'package:becarefulcrosswalk/service/my_direction.dart';
import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:becarefulcrosswalk/widgets/prompt_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:poly_geofence_service/poly_geofence_service.dart';
import 'package:provider/provider.dart';

import '../models/intersection_model.dart';
import '../provider/crosswalk_info.dart';
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
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  late num previousRemainingTime = 1000;
  late String trafficLightState;

  @override
  void initState() {
    super.initState();
    _geofenceService = widget.geofenceService;
    myLocation = MyLocation();
    mapControllerCompleter = Completer<NaverMapController>();
    _geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
    _geofenceService.start();
    _initPolyGeofenceService();
  }

  Future<void> _onGeofenceStatusChanged(
      Geofence geofence,
      GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus,
      Location location) async {
    setState(() {
      if (geofenceStatus == GeofenceStatus.ENTER) {
        print('@@@@@@@@@@@@@@@@@@@@${geofence.id}에 들어옴@@@@@@@@@@@@@@@@@@@@@');
        Provider.of<CrosswalkInfo>(context, listen: false)
            .setIntersectionId(int.parse(geofence.id));
        Provider.of<MyLocationState>(context, listen: false)
            .setMyLocationState(1); // 내 위치상태 원 안
        Provider.of<MyLocationState>(context, listen: false)
            .setGeofenceId(geofence.id);

        myLocation.startLocationTracking((p0) => null);
      } else if (geofenceStatus == GeofenceStatus.EXIT) {
        print('${geofence.id}에 나감');
        Provider.of<MyLocationState>(context, listen: false)
            .setMyLocationState(0); // 내 위치상태 원 밖
        Provider.of<MyLocationState>(context, listen: false).setGeofenceId('0');

        myLocation.stopLocationTracking();
      }
    });

    if (Provider.of<MyLocationState>(context, listen: false).myLocationState ==
        1) {
      // 원안에 들어오면
      IntersectionModel intersection =
          await ApiService.getIntersection(int.parse(geofence.id));
      log("api요청 완료했어");
      // await _initPolyGeofenceService(); // PolyGeofence 초기화

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
      }
      log("끝~!!@");
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
      log("poly시작");
    } catch (e) {
      print('Error starting polygeofence service: $e');
    }
  }

  Future<void> _onPolyGeofenceStatusChanged(PolyGeofence polyGeofence,
      PolyGeofenceStatus polyGeofenceStatus, Location location) async {
    setState(() async {
      // 횡단보도 직사각형 지오펜스에 들어왔을때
      if (polyGeofenceStatus == PolyGeofenceStatus.ENTER) {
        log("@@@@@@@@@@@@@@@횡단보도에 들어왔어@@@@@@@@@@@");
        log(polyGeofence.data.toString());
        Provider.of<MyLocationState>(context, listen: false)
            .setMyLocationState(2); // 위치상태 횡단보도 안
        Provider.of<MyLocationState>(context, listen: false)
            .setGeofenceId(polyGeofence.id);
        Provider.of<CrosswalkInfo>(context, listen: false)
            .setCrosswalkInfo(polyGeofence.data["crosswalk"]);

        int geoId = int.parse(polyGeofence.data['geofenceId']);

        var trafficLightState = await ApiService.getTrafficLightState(
            geoId,
            polyGeofence
                .data["crosswalk"].direction); // 현재 신호등 빨간불인지 초록불인지 받아와서 저장하기
        log('trafficLightState : $trafficLightState');
        if (trafficLightState == 'protected-Movement-Allowed' ||
            trafficLightState == 'permissive-Movement-Allowed') {
          Provider.of<CrosswalkInfo>(context, listen: false)
              .setTrafficLightState('green');
        } else {
          Provider.of<CrosswalkInfo>(context, listen: false)
              .setTrafficLightState('red');
        }
      } else if (polyGeofenceStatus == PolyGeofenceStatus.EXIT) {
        Provider.of<MyLocationState>(context, listen: false)
            .setMyLocationState(1); // 원 안
        Provider.of<MyLocationState>(context, listen: false)
            .setGeofenceId(polyGeofence.data['geofenceId']);

        print('횡단보도 나감');

        MyDirection().stopListening();
      }
    });
  }

  // locationState에 따른 메시지를 반환하는 함수
  String getPromptMessage() {
    switch (Provider.of<MyLocationState>(context).myLocationState) {
      case 1:
        return '근방에 보행자 신호등이 있습니다. 점자블록을 따라 건너시려는 횡단보도 앞으로 가주세요.';
      case 2:
        myLocation.getCurrentLocation();
        if (getClosestLocationIndex(
                myLocation,
                Provider.of<CrosswalkInfo>(context)
                    .crosswalkInfo!
                    .midpointList[0],
                Provider.of<CrosswalkInfo>(context)
                    .crosswalkInfo!
                    .midpointList[1]) ==
            0) {
          return "${Provider.of<CrosswalkInfo>(context).crosswalkInfo?.sideOne}방면 ${Provider.of<CrosswalkInfo>(context).crosswalkInfo?.length}미터 횡단보도입니다. 신호 정보를 받으시려면 안내 시작 버튼을 눌러주세요.";
        } else {
          return "${Provider.of<CrosswalkInfo>(context).crosswalkInfo?.sideTwo}방면 ${Provider.of<CrosswalkInfo>(context).crosswalkInfo?.length}미터 횡단보도입니다. 신호 정보를 받으시려면 안내 시작 버튼을 눌러주세요.";
        }
      case 3:
        return '';
      default:
        return '근방에 보행자 신호등이 없습니다.';
    }
  }

  void setMyLocationState3() {
    Provider.of<MyLocationState>(context, listen: false).setMyLocationState(3);

    Crosswalk? temp =
        Provider.of<CrosswalkInfo>(context, listen: false).crosswalkInfo;
    if (getClosestLocationIndex(
            myLocation, temp!.midpointList[0], temp!.midpointList[1]) ==
        0) {
      MyDirection().startListening(
          double.parse(temp.coordinateList[2].latitude),
          double.parse(temp.coordinateList[2].longitude),
          double.parse(temp.coordinateList[3].latitude),
          double.parse(temp.coordinateList[3].longitude),
          double.parse(temp.midpointList[1].latitude),
          double.parse(temp.midpointList[1].longitude),
          double.parse(temp.length));
    } else {
      MyDirection().startListening(
          double.parse(temp.coordinateList[0].latitude),
          double.parse(temp.coordinateList[0].longitude),
          double.parse(temp.coordinateList[1].latitude),
          double.parse(temp.coordinateList[1].longitude),
          double.parse(temp.midpointList[0].latitude),
          double.parse(temp.midpointList[0].longitude),
          double.parse(temp.length));
    }
  }

  int getClosestLocationIndex(
      MyLocation myLocation, Coordinate a, Coordinate b) {
    double distanceToA = MyDirection().calculateDistance(
        myLocation.latitude,
        myLocation.longitude,
        double.parse(a.latitude),
        double.parse(a.longitude));
    double distanceToB = MyDirection().calculateDistance(
        myLocation.latitude,
        myLocation.longitude,
        double.parse(b.latitude),
        double.parse(b.longitude));

    return (distanceToA < distanceToB) ? 0 : 1;
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
        title: const Text(
          '실시간 신호정보',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Provider.of<MyLocationState>(context).myLocationState == 3
              ? Container() // 상태가 3일 때 빈 컨테이너를 표시
              : PromptWidget(message: getPromptMessage()),
          if (Provider.of<MyLocationState>(context).myLocationState == 3)
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: const Color(0xFF48A3F7),
              child: Text(
                '남은거리: 약 ${MyDirection().getRemainingDistance}미터 \n 안전각도여부: ${MyDirection().getIsSafeAngle} \n 절반이상보행: ${MyDirection().getIsPassHalf}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
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
            ),
          ),
          if (Provider.of<MyLocationState>(context, listen: false)
                  .myLocationState ==
              2)
            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  setMyLocationState3();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(0xFFFFCA41),
                  shape: const RoundedRectangleBorder(),
                  minimumSize: const Size(double.infinity, 20),
                ),
                child: const Text(
                  "안내 시작",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    letterSpacing: 5,
                  ),
                ),
              ),
            ),
          if (Provider.of<MyLocationState>(context, listen: false)
                  .myLocationState ==
              3)
            StreamBuilder(
              stream: _dbRef
                  .child(
                      'trafficlight-data/${Provider.of<CrosswalkInfo>(context, listen: false).intersectionId}')
                  .onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData ||
                    snapshot.data?.snapshot.value == null) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                Map<dynamic, dynamic> trafficLightData =
                    (snapshot.data!.snapshot.value as Map<dynamic, dynamic>);
                String lightColor = ''; // 신호 색상
                Color backgroundColor = const Color(0xFFFFFFFF);
                String? direction =
                    Provider.of<CrosswalkInfo>(context, listen: false)
                        .crosswalkInfo
                        ?.direction; // 횡단보도 방향

                if (Provider.of<CrosswalkInfo>(context, listen: false)
                        .trafficLightState ==
                    "green") {
                  lightColor = "초록";
                  backgroundColor = const Color(0xFF7EC25E);
                } else if (Provider.of<CrosswalkInfo>(context, listen: false)
                        .trafficLightState ==
                    "red") {
                  lightColor = "빨간";
                  backgroundColor = const Color(0xFFFD7559);
                }

                num remainingTime =
                    (trafficLightData[direction] / 10).toInt(); // 잔여 시간

                Future.microtask(() {
                  if (previousRemainingTime < remainingTime) {
                    if (Provider.of<CrosswalkInfo>(context, listen: false)
                            .trafficLightState ==
                        "green") {
                      Provider.of<CrosswalkInfo>(context, listen: false)
                          .setTrafficLightState("red");
                    } else if (Provider.of<CrosswalkInfo>(context,
                                listen: false)
                            .trafficLightState ==
                        "red") {
                      Provider.of<CrosswalkInfo>(context, listen: false)
                          .setTrafficLightState("green");
                    }
                  }

                  previousRemainingTime = remainingTime;
                });

                return PromptWidget(
                  message:
                      "$lightColor불 ${remainingTime < 2 ? 0 : (remainingTime - 2)}초",
                  backgroundColor: backgroundColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                );
              },
            ),
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
