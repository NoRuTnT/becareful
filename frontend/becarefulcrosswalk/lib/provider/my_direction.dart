import 'package:flutter/foundation.dart';

class MyDirection with ChangeNotifier {
  double? _headingAngle; // 디바이스가 바라보고 있는 방위각
  double? _destAngle1; // 목적지 한쪽 끝 방위각
  double? _destAngle2; // 목적지 다른 한쪽끝 방위각
  bool? _isSafeAngle; // 안전 범위를 바라보고 있는지 여부
  double? _remainingDistance; // 목적지 중간점까지 남은 거리
  bool? _isPassHalf; // 횡단보도의 절반 지점을 지났는지 여부

  double? get getHeadingAngle {
    return _headingAngle;
  }

  double? get getDestAngle1 {
    return _destAngle1;
  }

  double? get getDestAngle2 {
    return _destAngle2;
  }

  bool? get getIsSafeAngle {
    return _isSafeAngle;
  }

  double? get getRemainingDistance {
    return _remainingDistance;
  }

  bool? get getIsPassHalf {
    return _isPassHalf;
  }

  void setHeadingAngle(double? value) {
    _headingAngle = value;
    notifyListeners();
  }

  void setDestAngle1(double? value) {
    _destAngle1 = value;
    notifyListeners();
  }

  void setDestAngle2(double? value) {
    _destAngle2 = value;
    notifyListeners();
  }

  void setIsSafeAngle(bool? value) {
    _isSafeAngle = value;
    notifyListeners();
  }

  void setRemainingDistance(double? value) {
    _remainingDistance = value;
    notifyListeners();
  }

  void setIsPassHalf(bool value) {
    _isPassHalf = value;
    notifyListeners();
  }
}
