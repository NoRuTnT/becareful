import 'package:flutter/cupertino.dart';

class CurrentPage with ChangeNotifier {
  String _currentPage = '';

  String get currentPage => _currentPage;

  void setCurrentPage(String page) {
    _currentPage = page;
    notifyListeners();
  }
}
