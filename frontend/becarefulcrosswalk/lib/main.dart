import 'package:becarefulcrosswalk/firebase_options.dart';
import 'package:becarefulcrosswalk/provider/report_data.dart';
import 'package:becarefulcrosswalk/screens/landing_screen.dart';
import 'package:becarefulcrosswalk/screens/map_screen.dart';
import 'package:becarefulcrosswalk/screens/report/report_photo_screen.dart';
import 'package:becarefulcrosswalk/screens/userGuide/user_guide_screen.dart';
import 'package:becarefulcrosswalk/screens/userGuide/user_guide_screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReportData>(
      create: (context) => ReportData(),
      child: MaterialApp(
        routes: {
          '/': (context) => const LandingScreen(),
          '/map': (context) => const MapScreen(),
          '/report': (context) => const ReportPhotoScreen(),
          '/userGuide': (context) => const UserGuideScreen(),
          '/userGuide2': (context) => const UserGuideScreen2(),
        },
        initialRoute: '/',
      ),
    );
  }
}
