import 'dart:async';
import 'dart:convert';

import 'package:becarefulcrosswalk/env/env.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

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

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<String> convertCoordinatesToAddress(double lat, double lng) async {
    final String clientId = Env.naverApiKey;
    final String clientSecret = Env.naverClientSecret;
    final response = await http.get(
      Uri.parse(
          'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?coords=$lng,$lat&output=json'),
      headers: {
        "X-NCP-APIGW-API-KEY-ID": clientId,
        "X-NCP-APIGW-API-KEY": clientSecret,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var region = jsonResponse['results'][0]['region'];
      var land = jsonResponse['results'][0]['land'];

      var number1 = land != null ? land['number1'] : "";
      var number2 =
          land != null && land['number2'] != null ? land['number2'] : "";

      var address = region['area1']['name'] +
          " " +
          region['area2']['name'] +
          " " +
          region['area3']['name'] +
          " " +
          number1 +
          " " +
          number2;

      return address; // 도로명 주소 반환
    } else {
      throw Exception('Failed to load road address');
    }
  }

  Future<String> getRoadAddress() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation(); // 현재 위치 가져오기
    String roadAddress = await convertCoordinatesToAddress(
        myLocation.latitude, myLocation.longitude); // 도로명 주소 변환
    return roadAddress; // 변환된 도로명 주소 출력
  }
}
