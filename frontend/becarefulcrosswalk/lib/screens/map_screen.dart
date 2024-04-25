import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final Completer<NaverMapController> mapControllerCompleter;

  @override
  void initState() {
    super.initState();
    initializeNaverMap();
    mapControllerCompleter = Completer<NaverMapController>();
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
        future: initializeNaverMap(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return NaverMap(
              options: const NaverMapViewOptions(
                indoorEnable: true,
                locationButtonEnable: false,
                consumeSymbolTapEvents: false,
              ),
              onMapReady: (controller) {
                mapControllerCompleter.complete(controller);
                log("onMapReady", name: "onMapReady");
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
