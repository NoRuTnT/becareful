import 'package:flutter/cupertino.dart';

import '../models/intersection_model.dart';

class CrosswalkInfo with ChangeNotifier {
  Crosswalk? crosswalkInfo;
  String? trafficLightState;
  int? intersectionId;

  void setCrosswalkInfo(Crosswalk c) {
    crosswalkInfo = c;
    notifyListeners();
  }

  void setTrafficLightState(String s) {
    trafficLightState = s;
    notifyListeners();
  }

  void setIntersectionId(int i) {
    intersectionId = i;
    notifyListeners();
  }
}
