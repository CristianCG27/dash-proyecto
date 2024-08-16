import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  int _tiempo = 1000;
  int _pos = 1;
  String _productoId = "66be7d973049afa616f79430";
  String _tallaId = "66be7d973049afa616f79437";


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

  String get productoId => _productoId;

  void sendPId(String newPId) {
    _productoId = newPId ;
    notifyListeners();
  }
  
  String get tallaId => _tallaId;

  void sendTId(String newPId) {
    _tallaId = newPId ;
    notifyListeners();
  }

}
