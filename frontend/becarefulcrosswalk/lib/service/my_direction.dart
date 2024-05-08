import 'dart:async';
import 'dart:math';

import 'package:becarefulcrosswalk/service/my_location.dart';
import 'package:flutter_compass/flutter_compass.dart';

class MyDirection {
  // 방위각을 리스닝하기 위한 StreamSubscription 인스턴스
  StreamSubscription<CompassEvent>? _compassSubscription;

  // 디바이스의 현재 방위각
  double? _currentHeading;

  // 방위각 리스닝 시작
  void startListening() {
    _compassSubscription = FlutterCompass.events!.listen((CompassEvent event) {
      _currentHeading = event.heading;
    });
  }

  // 방위각 리스닝 중지
  void stopListening() {
    _compassSubscription?.cancel();
  }

  // 디바이스의 현재 방위각 가져오기
  double? getCurrentHeading() {
    return _currentHeading;
  }

  // 현재 위치에서 목적지 방향의 방위각
  Future<double> getAzimuthDestination(double destLat, double destLng) async {
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation();
    return calculateBearing(
        myLocation.latitude, myLocation.longitude, destLat, destLng);
  }

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
}
