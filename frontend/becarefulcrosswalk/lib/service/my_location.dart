import 'dart:async';

import 'package:geolocator/geolocator.dart';

class MyLocation {
  double latitude = 0;
  double longitude = 0;
  StreamSubscription<Position>? locationSubscription;

  Future<void> startLocationTracking(
      Function(Position) onLocationChanged) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      // 권한이 영구적으로 거부되었을 때의 처리 로직
      return;
    }

    locationSubscription = Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
                accuracy: LocationAccuracy.high,
                distanceFilter: 3 // 3 미터마다 업데이트
                ))
        .listen((Position position) {
      latitude = position.latitude;
      longitude = position.longitude;
      onLocationChanged(position); // 콜백 함수 실행
    });
  }

  void stopLocationTracking() {
    locationSubscription?.cancel();
  }
}
