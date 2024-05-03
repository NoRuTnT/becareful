import 'dart:async';
import 'dart:developer';

import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:poly_geofence_service/poly_geofence_service.dart';

import '../models/intersection_model.dart';
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
    myLocation = MyLocation();
    _geofenceService = widget.geofenceService;
    mapControllerCompleter = Completer<NaverMapController>();
  }

  Future<void> _initGeofenceService() async {
    _geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);

    try {
      await _geofenceService.start();
    } catch (e) {
      print('Error starting geofence service: $e');
    }
  }

  Future<void> _onGeofenceStatusChanged(
      Geofence geofence,
      GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus,
      Location location) async {
    if (geofenceStatus == GeofenceStatus.ENTER) {
      print('@@@@@@@@@@@@@@@@@@@@${geofence.id}에 들어옴@@@@@@@@@@@@@@@@@@@@@');

      IntersectionModel intersection =
          await ApiService.getIntersection(geofence.id as num);

      await _initPolyGeofenceService(); // polygeofence 초기화

      for (Crosswalk crosswalk in intersection.crosswalks) {
        _polyGeofenceService.addPolyGeofence(
          PolyGeofence(
            id: crosswalk.crosswalkId,
            data: {
              "crosswalk": crosswalk,
            },
            polygon: <LatLng>[
              LatLng(crosswalk.coordinate[0].latitude as double,
                  crosswalk.coordinate[0].longitude as double),
              LatLng(crosswalk.coordinate[1].latitude as double,
                  crosswalk.coordinate[1].longitude as double),
              LatLng(crosswalk.coordinate[2].latitude as double,
                  crosswalk.coordinate[2].longitude as double),
              LatLng(crosswalk.coordinate[3].latitude as double,
                  crosswalk.coordinate[3].longitude as double),
            ],
          ),
        );
      }
    } else if (geofenceStatus == GeofenceStatus.EXIT) {
      print('${geofence.id}에 나감');
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
    } catch (e) {
      print('Error starting polygeofence service: $e');
    }
  }

  Future<void> _onPolyGeofenceStatusChanged(PolyGeofence polyGeofence,
      PolyGeofenceStatus polyGeofenceStatus, Location location) async {
    if (polyGeofenceStatus == PolyGeofenceStatus.ENTER) {
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => TrafficInfoScreen(id: polyGeofence.num as int, crosswalk: polyGeofence.data.crosswalk))
      // );
    } else if (polyGeofenceStatus == PolyGeofenceStatus.EXIT) {
      print('횡단보도 나감');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initGeofenceService(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return NaverMap(
              options: NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                    target: NLatLng(myLocation.latitude, myLocation.longitude),
                    zoom: 17,
                    bearing: 0,
                    tilt: 0),
                indoorEnable: true, // 실내 맵 사용 가능 여부
                locationButtonEnable: true, // 위치 버튼 표시 여부
                consumeSymbolTapEvents: true, // 심볼 탭 이벤트 소비 여부
              ),
              onMapReady: (controller) {
                mapControllerCompleter.complete(controller);
                controller.setLocationTrackingMode(NLocationTrackingMode.face);
                log("onMapReady", name: "onMapReady");
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
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
