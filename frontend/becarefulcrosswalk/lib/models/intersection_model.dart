class IntersectionModel {
  final num intersectionId;
  final List<Crosswalk> crosswalks;

  IntersectionModel({required this.intersectionId, required this.crosswalks});

  factory IntersectionModel.fromJson(Map<String, dynamic> json) {
    return IntersectionModel(
      intersectionId: json['intersectionId'],
      crosswalks: (json['crosswalks'] as List)
          .map((crosswalkJson) => Crosswalk.fromJson(crosswalkJson))
          .toList(),
    );
  }
}

class Crosswalk {
  final String crosswalkId;
  final String crosswalkDirection;
  final String direction;
  final String length;
  final List<Coordinate> coordinate;

  Crosswalk({
    required this.crosswalkId,
    required this.crosswalkDirection,
    required this.direction,
    required this.length,
    required this.coordinate,
  });

  factory Crosswalk.fromJson(Map<String, dynamic> json) {
    return Crosswalk(
      crosswalkId: json['crosswalkId'],
      crosswalkDirection: json['crosswalkDirection'],
      direction: json['direction'],
      length: json['length'],
      coordinate: (json['coordinate'] as List)
          .map((coordinateJson) => Coordinate.fromJson(coordinateJson))
          .toList(),
    );
  }
}

class Coordinate {
  final String latitude;
  final String longitude;

  Coordinate({required this.latitude, required this.longitude});

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

/*
  intersectionId : 2217,
  crosswalks :
  [
    {
      "crosswalkId": "1",
      "crosswalkDirection": "역삼역 방향",
      "direction" : "north",
      "length" : "15",
      "coordinate" :
      [
        {
          "longitude" : "367.1231",
          "latitude" : " 153125.125125",
        },
        {
          "longitude" : "367.1231",
          "latitude" : " 153125.125125",
        },
        {
          "longitude" : "367.1231",
          "latitude" : " 153125.125125",
        },
        {
          "longitude" : "367.1231",
          "latitude" : " 153125.125125",
        },
      ]
    },
    {
      "crosswalktId": "2",
      "crosswalkDirection": "강남역 방향",
      "direction" : "south",
      "length" : "15",
      "coordinate" :
      [
        {
          "longitude" : "367.1231",
          "latitude" : " 153125.125125",
        },
        {
          "longitude" : "367.1231",
          "latitude" : " 153125.125125",
        },
        {
          "longitude" : "367.1231",
          "latitude" : " 153125.125125",
        },
        {
          "longitude" : "367.1231",
          "latitude" : " 153125.125125",
        },
      ]
    },
  ]
 */
