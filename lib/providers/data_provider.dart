import 'package:flutter/material.dart';

// class DataProvider extends InheritedWidget {
//   final String data;

//   const DataProvider({super.key, required this.data, required Widget child}) : super(child: child);

//   static DataProvider? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<DataProvider>();
//   }

//   @override
//   bool updateShouldNotify(DataProvider oldWidget) {
//     return data != oldWidget.data;
//   }
// }

class DataProvider extends ChangeNotifier {
  int _tiempo = 1000;

  int get tiempo => _tiempo;

  void updateData(int newData) {
    _tiempo = newData;
    notifyListeners();
  }
}
