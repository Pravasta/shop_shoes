import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int _currIndex = 0;

  int get currIndex => _currIndex;
  set currIndex(int index) {
    _currIndex = index;
    notifyListeners();
  }
}
