import 'package:flutter/cupertino.dart';

class MyLocationState with ChangeNotifier {
  int myLocationState = 0; // 0 : 원밖, 1 : 원안, 2 : 직사각형 안 3: 횡단보도 건너기

  void setMyLocationState(int state) {
    myLocationState = state;
    notifyListeners();
  }
}
