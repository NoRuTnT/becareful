import 'dart:io';

import 'package:becarefulcrosswalk/service/api_service.dart';
import 'package:flutter/foundation.dart';

class ReportData with ChangeNotifier {
  File? _imageFile;
  String? _roadAddress;
  String? _reportText;

  void setImageFile(File newFile) {
    _imageFile = newFile;
    notifyListeners();
  }

  void setRoadAddress(String newAddress) {
    _roadAddress = newAddress;
    notifyListeners();
  }

  void setReportText(String newText) {
    _reportText = newText;
    notifyListeners();
  }

  void clearImageFile() {
    _imageFile = null;
    notifyListeners();
  }

  void clearRoadAddress() {
    _roadAddress = null;
    notifyListeners();
  }

  void clearReportText() {
    _reportText = null;
    notifyListeners();
  }

  Future<bool> sendReportToServer() async {
    if (_imageFile == null || _roadAddress == null || _reportText == null) {
      print("Data is incomplete.");
      return false;
    }

    return await ApiService.sendReport(
        _roadAddress!, _reportText!, _imageFile!);
  }
}
