class IntersectionModel {
  final int intersectionId;
  final List<Crosswalk> crosswalkList;

  IntersectionModel(
      {required this.intersectionId, required this.crosswalkList});

  factory IntersectionModel.fromJson(Map<String, dynamic> json) {
    return IntersectionModel(
      intersectionId: json['intersectionId'],
      crosswalkList: (json['crosswalkList'] as List)
          .map((crosswalkJson) => Crosswalk.fromJson(crosswalkJson))
          .toList(),
    );
  }
}

class Crosswalk {
  final int crosswalkId;
  final String sideOne;
  final String sideTwo;
  final String direction;
  final String length;
  final List<Coordinate> coordinateList;
  final List<Coordinate> midpointList;

  Crosswalk({
    required this.crosswalkId,
    required this.sideOne,
    required this.sideTwo,
    required this.direction,
    required this.length,
    required this.coordinateList,
    required this.midpointList,
  });

  factory Crosswalk.fromJson(Map<String, dynamic> json) {
    return Crosswalk(
      crosswalkId: json['crosswalkId'],
      sideOne: json['sideOne'],
      sideTwo: json['sideTwo'],
      direction: json['direction'],
      length: json['length'],
      coordinateList: (json['coordinateList'] as List)
          .map((coordinateJson) => Coordinate.fromJson(coordinateJson))
          .toList(),
      midpointList: (json['midpointList'] as List)
          .map((midpointJson) => Coordinate.fromJson(midpointJson))
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
  crosswalkList :
  [
    {
      "crosswalkId": 1,
      "sideOne": "역삼역 방향",
      "sideTwo": "선릉역 방향",
      "direction" : "ntPdsgRmdrCs",
      "length" : "15",
      "coordinateList" :
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
        }
      ],
      "midpointList" :
      [
        {
          "longitude" : "367.1231",
          "latitude" : " 153125.125125",
        },
        {
          "longitude" : "367.1231",
          "latitude" : " 153125.125125",
        }
      ]
    },
    {
      "crosswalktId": 2,
      "crosswalkDirection": "강남역 방향",
      "direction" : "ntPdsgRmdrCs",
      "length" : "15",
      "coordinateList" :
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
        }
      ],
      "midpointList" :
      [
        {
          "longitude" : "367.1231",
          "latitude" : " 153125.125125",
        },
        {
          "longitude" : "367.1231",
          "latitude" : " 153125.125125",
        }
      ]
    },
  ]
 */
