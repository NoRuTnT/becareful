import 'dart:async';
import 'dart:math';

import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vibration/vibration.dart';

class MyDirection {
  // 디바이스의 현재 방위각을 리스닝하기 위한 StreamSubscription 인스턴스
  StreamSubscription<CompassEvent>? _compassSubscription;

  // 디바이스의 현재 방위각
  double? _currentHeading;

  // 디바이스의 현재 방위각 리스닝 시작
  void startListening() {
    _compassSubscription = FlutterCompass.events!.listen((CompassEvent event) {
      _currentHeading = event.heading;
    });
  }

  // 디바이스의 현재 방위각 리스닝 중지
  void stopListening() {
    _compassSubscription?.cancel();
  }

  // 디바이스의 현재 방위각 가져오기
  double? getCurrentHeading() {
    return _currentHeading;
  }

  // 현재 위치에서 목적지 방향의 방위각
  double? _azimuthDestination;

  // 현재 위치에서 목적지 방향의 방위각 리스닝 시작
  void startLocationUpdates(double destLat, double destLng) {
    Geolocator.getPositionStream().listen((Position myLocation) {
      _azimuthDestination = calculateBearing(
          myLocation.latitude, myLocation.longitude, destLat, destLng);
    });
  }

  // 두 지점 사이의 방위각 계산
  double calculateBearing(
      double startLat, double startLng, double endLat, double endLng) {
    // 라디안으로 변환
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

    // 라디안에서 도(degree)로 변환
    return (degrees(bearing) + 360) % 360;
  }

  double radians(double degree) {
    return degree * pi / 180.0;
  }

  double degrees(double radian) {
    return radian * 180.0 / pi;
  }

  void guideWithVibration(double destLat, double destLng) async {
    if (_currentHeading == null || _azimuthDestination == null) return;

    void safeVibration() {
      Vibration.vibrate(pattern: [100, 400, 100, 400]); // 짧고 반복적인 패턴
    }

    void warningVibration() {
      Vibration.vibrate(pattern: [500, 1000, 500, 2000]); // 길고 강한 패턴
    }

    if (_azimuthDestination! - 20 < 0) {
      if ((_azimuthDestination! - 20 + 360 <= _currentHeading! &&
              _currentHeading! <= 360) ||
          (0 <= _currentHeading! &&
              _currentHeading! <= _azimuthDestination! + 20)) {
        safeVibration();
      } else {
        warningVibration();
      }
    } else if (_azimuthDestination! + 20 >= 360) {
      if ((_azimuthDestination! - 20 <= _currentHeading! &&
              _currentHeading! <= 360) ||
          (0 <= _currentHeading! &&
              _currentHeading! <= _azimuthDestination! + 20 - 360)) {
        safeVibration();
      } else {
        warningVibration();
      }
    } else {
      if (_azimuthDestination! - 20 <= _currentHeading! &&
          _currentHeading! <= _azimuthDestination! + 20) {
        safeVibration();
      } else {
        warningVibration();
      }
    }
  }
}
