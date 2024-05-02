import 'dart:async';
import 'dart:developer';

import 'package:becarefulcrosswalk/models/geofence_model.dart';
import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geofence_service/geofence_service.dart';

import '../env/env.dart';
import '../service/my_location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _geofenceService = GeofenceService.instance.setup(
      interval: 5000,
      accuracy: 100,
      loiteringDelayMs: 60000,
      statusChangeDelayMs: 10000,
      useActivityRecognition: true,
      allowMockLocations: false,
      printDevLog: false,
      geofenceRadiusSortType: GeofenceRadiusSortType.DESC);
  late final Completer<NaverMapController> mapControllerCompleter;
  late final MyLocation myLocation;
  late Future<void> initializationFuture;

  @override
  void initState() {
    super.initState();
    myLocation = MyLocation();
    initializationFuture = initializeEverything();
    mapControllerCompleter = Completer<NaverMapController>();
  }

  Future<void> initializeEverything() async {
    await Future.wait([initializeNaverMap(), _initGeofenceService()]);
  }

  Future<void> _initGeofenceService() async {
    _geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
    _geofenceService.addGeofenceList(GeofenceModel.geofences);
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
      print('${geofence.id}에 들어옴');
    } else if (geofenceStatus == GeofenceStatus.EXIT) {
      print('${geofence.id}에 나감');
    }
  }

  // 네이버 맵 SDK 초기화
  Future<void> initializeNaverMap() async {
    try {
      await NaverMapSdk.instance.initialize(
          clientId: Env.naverApiKey,
          onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed"));
      log("Naver Map SDK initialized successfully.");
    } catch (e) {
      log("Failed to initialize Naver Map SDK: $e", name: "onAuthFailed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: initializationFuture,
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
