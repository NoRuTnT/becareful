import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vibration/vibration.dart';

class MyDirection {
  StreamSubscription<CompassEvent>? _compassSubscription;
  StreamSubscription<Position>? _positionSubscription;

  double? _headingAngle; // 디바이스가 바라보고 있는 방위각
  double? _destAngle1; // 목적지 한쪽 끝 방위각
  double? _destAngle2; // 목적지 다른 한쪽끝 방위각
  bool? _isSafeAngle; // 안전 범위를 바라보고 있는지 여부
  double? _remainingDistance; // 목적지 중간점까지 남은 거리
  bool _isPassHalf = false; // 횡단보도의 절반 지점을 지났는지 여부

  bool? get getIsSafeAngle {
    return _isSafeAngle;
  }

  double? get getRemainingDistance {
    return _remainingDistance;
  }

  bool? get getIsPassHalf {
    return _isPassHalf;
  }

  void startListening(double destLat1, double destLng1, double destLat2,
      double destLng2, double midLat, double midLng, double length) {
    _compassSubscription = FlutterCompass.events!.listen((CompassEvent event) {
      _headingAngle = event.heading;
      checkSafeAngle();
    });
    _positionSubscription =
        Geolocator.getPositionStream().listen((Position myLocation) {
      _destAngle1 = calculateAngle(
          myLocation.latitude, myLocation.longitude, destLat1, destLng1);
      _destAngle2 = calculateAngle(
          myLocation.latitude, myLocation.longitude, destLat2, destLng2);
      checkSafeAngle();

      _remainingDistance = calculateDistance(
          myLocation.latitude, myLocation.longitude, midLat, midLng);
      if (!_isPassHalf) {
        checkHalfWalk(length);
      }
    });
  }

  void stopListening() {
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

  void checkSafeAngle() {
    if (_headingAngle == null || _destAngle1 == null || _destAngle2 == null) {
      return;
    }

    double maxAngle = max(_destAngle1!, _destAngle2!);
    double minAngle = min(_destAngle1!, _destAngle2!);

    if (maxAngle - minAngle >= 180) {
      _isSafeAngle = ((maxAngle < _headingAngle! && _headingAngle! <= 360) ||
          (0 <= _headingAngle! && _headingAngle! <= minAngle));
    } else {
      _isSafeAngle = (minAngle <= _headingAngle! && _headingAngle! <= maxAngle);
    }
    guideWithVibration();
  }

  void guideWithVibration() {
    if (_isSafeAngle == null) {
      return;
    }
    if (_isSafeAngle!) {
      Vibration.vibrate(pattern: [100, 100, 100, 100, 100, 200]);
    } else {
      Vibration.cancel();
    }
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = pi / 180;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)); // 2 * R; R = 6371 km
  }

  void checkHalfWalk(double length) {
    if (_remainingDistance == null) {
      return;
    }
    if (_remainingDistance! <= length / 2) {
      _isPassHalf = true;
      final player = AudioPlayer();
      player.play(AssetSource('sounds/half-pass.mp3'));
    }
  }
}
