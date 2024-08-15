import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  int _tiempo = 1000;
  int _pos = 1;

  int get tiempo => _tiempo;

  void updateData(int newData) {
    _tiempo = newData;
    notifyListeners();
  }

  int get pos => _pos;

  void updatePos(int newPos) {
    _pos = (11 - newPos);
    notifyListeners();
  }
}
