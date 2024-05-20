import 'dart:async';
import 'dart:math';

import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vibration/vibration.dart';

class MyDirection {
  StreamSubscription<CompassEvent>? _compassSubscription;
  StreamSubscription<Position>? _positionSubscription;

  double? _headingAngle; // 디바이스가 바라보고 있는 방위각
  double? _destAngle1; // 목적지 한쪽 끝 방위각
  double? _destAngle2; // 목적지 다른 한쪽끝 방위각

  late bool isSafe;

  void startAngleListening(double leftDestLat, double leftDestLng,
      double rightDestLat, double rightDestLng) {
    _compassSubscription = FlutterCompass.events!.listen((CompassEvent event) {
      _headingAngle = event.heading;
    });
    _positionSubscription =
        Geolocator.getPositionStream().listen((Position myLocation) {
      _destAngle1 = calculateAngle(
          myLocation.latitude, myLocation.longitude, leftDestLat, leftDestLng);
      _destAngle2 = calculateAngle(myLocation.latitude, myLocation.longitude,
          rightDestLat, rightDestLng);
    });
  }

  void stopAngleListening() {
    _compassSubscription?.cancel();
    _positionSubscription?.cancel();
  }

  // 두 지점 사이의 방위각 계산
  double calculateAngle(
      double startLat, double startLng, double endLat, double endLng) {
    var startLatRad = radians(startLat);
    var startLngRad = radians(startLng);
    var endLatRad = radians(endLat);
    var endLngRad = radians(endLng);

    var dLng = endLngRad - startLngRad;

    var bearing = atan2(
      sin(dLng) * cos(endLatRad),
      cos(startLatRad) * sin(endLatRad) -
          sin(startLatRad) * cos(endLatRad) * cos(dLng),
    );

    return (degrees(bearing) + 360) % 360;
  }

  double radians(double degree) {
    return degree * pi / 180.0;
  }

  double degrees(double radian) {
    return radian * 180.0 / pi;
  }

  void checkSafe() {
    if (_headingAngle == null || _destAngle1 == null || _destAngle2 == null) {
      return;
    }

    double maxAngle = max(_destAngle1!, _destAngle2!);
    double minAngle = min(_destAngle1!, _destAngle2!);

    if (maxAngle - minAngle >= 180) {
      isSafe = ((maxAngle < _headingAngle! && _headingAngle! <= 360) ||
          (0 <= _headingAngle! && _headingAngle! <= minAngle));
    } else {
      isSafe = (minAngle <= _headingAngle! && _headingAngle! <= maxAngle);
    }
  }

  void guideWithVibration(double destLat, double destLng) {
    if (isSafe) {
      Vibration.vibrate(pattern: [100, 400, 100, 400]); // 짧고 반복적인 패턴
    } else {
      Vibration.vibrate(pattern: [500, 1000, 500, 2000]); // 길고 강한 패턴
    }
  }
}
