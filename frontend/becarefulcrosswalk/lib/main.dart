import 'dart:developer';

import 'package:becarefulcrosswalk/firebase_options.dart';
import 'package:becarefulcrosswalk/provider/current_page.dart';
import 'package:becarefulcrosswalk/provider/my_location_state.dart';
import 'package:becarefulcrosswalk/provider/report_data.dart';
import 'package:becarefulcrosswalk/screens/landing_screen.dart';
import 'package:becarefulcrosswalk/screens/map_screen.dart';
import 'package:becarefulcrosswalk/screens/report/report_photo_screen.dart';
import 'package:becarefulcrosswalk/screens/userGuide/user_guide_screen.dart';
import 'package:becarefulcrosswalk/screens/userGuide/user_guide_screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:provider/provider.dart';

import 'env/env.dart';
import 'models/geofence_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 바인딩 초기화
  await FlutterConfig.loadEnvVariables();
  await initializeNaverMap();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final geofenceService = GeofenceService.instance.setup(
    interval: 5000,
    accuracy: 100,
    loiteringDelayMs: 60000,
    statusChangeDelayMs: 10000,
    useActivityRecognition: true,
    allowMockLocations: false,
    printDevLog: false,
    geofenceRadiusSortType: GeofenceRadiusSortType.DESC,
  );

  // Geofence 목록 추가
  geofenceService.addGeofenceList(GeofenceModel.geofences);

  runApp(App(
    geofenceService: geofenceService,
  ));
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

class App extends StatelessWidget {
  final GeofenceService geofenceService;

  App({super.key, required this.geofenceService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReportData>(
          create: (context) => ReportData(),
        ),
        ChangeNotifierProvider<MyLocationState>(
          create: (context) => MyLocationState(),
        ),
        ChangeNotifierProvider<CurrentPage>(
          create: (context) => CurrentPage(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const LandingScreen(),
          '/map': (context) => MapScreen(geofenceService: geofenceService),
          '/report': (context) => const ReportPhotoScreen(),
          '/userGuide': (context) => const UserGuideScreen(),
          '/userGuide2': (context) => const UserGuideScreen2(),
        },
        initialRoute: '/',
      ),
    );
  }
}
