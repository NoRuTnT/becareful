import 'package:becarefulcrosswalk/screens/landing_screen.dart';
import 'package:becarefulcrosswalk/screens/map_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LandingScreen(),
        '/map': (context) => const MapScreen(),
        // '/report': (context) => const ReportScreen(),
        // '/userGuide' : (context) => const userGuideScreen(),
      },
      initialRoute: '/',
    );
  }
}
