// lib/geofence_config.dart

import 'package:geofence_service/geofence_service.dart';

class GeofenceModel {
  static final List<Geofence> geofences = [
    Geofence(
      id: 'multicampus',
      latitude: 37.50138,
      longitude: 127.0396,
      radius: [
        GeofenceRadius(id: 'radius_50m', length: 50),
      ],
    ),
    Geofence(
      id: '2217',
      latitude: 37.50081,
      longitude: 127.0369,
      radius: [
        GeofenceRadius(id: 'radius_50m', length: 50),
      ],
    ),
    Geofence(
      id: 'gangnam',
      latitude: 37.49793,
      longitude: 127.0276,
      radius: [
        GeofenceRadius(id: 'radius_50m', length: 50),
      ],
    ),
    // 추가 지오펜스 설정 가능
  ];
}
