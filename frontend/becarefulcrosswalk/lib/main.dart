import 'package:becarefulcrosswalk/screens/main_screen.dart';
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
        '/': (context) => MainScreen(),
        '/map': (context) => const MapScreen(),
      },
      initialRoute: '/',
    );
  }
}
