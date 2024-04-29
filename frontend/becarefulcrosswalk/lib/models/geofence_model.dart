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
      id: 'yeoksam',
      latitude: 37.5013796,
      longitude: 127.0396029,
      radius: [
        GeofenceRadius(id: 'radius_50m', length: 50),
      ],
    ),
    Geofence(
      id: 'strange',
      latitude: 39.50138,
      longitude: 127.0396,
      radius: [
        GeofenceRadius(id: 'radius_50m', length: 50),
      ],
    ),
    // 추가 지오펜스 설정 가능
  ];
}
