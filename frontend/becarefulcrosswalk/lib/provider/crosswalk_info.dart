import 'package:flutter/cupertino.dart';

import '../models/intersection_model.dart';

class CrosswalkInfo with ChangeNotifier {
  Crosswalk? crosswalkInfo; // 0 : 원밖, 1 : 원안, 2 : 직사각형 안 3: 횡단보도 건너기

  void setCrosswalkInfo(Crosswalk c) {
    crosswalkInfo = c;
    notifyListeners();
  }
}
