import 'dart:async';
import 'dart:developer';

import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

import '../service/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final Completer<NaverMapController> mapControllerCompleter;
  late double latitude; // = 37.500725285;
  late double longitude; // = 127.036600396;
  late Future<void> initializationFuture;

  @override
  void initState() {
    super.initState();
    initializationFuture = initializeEverything();
    mapControllerCompleter = Completer<NaverMapController>();
  }

  Future<void> initializeEverything() async {
    await Future.wait([getLocationData(), initializeNaverMap()]);
  }

  Future<void> getLocationData() async {
    Location location = Location();
    try {
      await location.getCurrentLocation();
      setState(() {
        latitude = location.latitude;
        longitude = location.longitude;
      });
    } catch (e) {
      log("Failed to initialize my location: $e");
    }
  }

  // 네이버 맵 SDK 초기화
  Future<void> initializeNaverMap() async {
    try {
      await NaverMapSdk.instance.initialize(
          clientId: '0uz4hsj9ul',
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
                    target: NLatLng(latitude, longitude),
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
}
