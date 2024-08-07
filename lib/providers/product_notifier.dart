// import 'package:flutter/material.dart';

// class ProductNotifier extends ChangeNotifier {
//   int _activePage = 0;
//   List<dynamic> _shoeSizes = [];
//   List<String> _sizes = [];

//   int get activepage => _activePage;

//   set activePage(int newIndex) {
//     _activePage = newIndex;
//     notifyListeners();
//   }

//   List<dynamic> get shoeSizes => _shoeSizes;

//   set shoesSizes(List<dynamic> newSizes) {
//     _shoeSizes = newSizes;
//     notifyListeners();
//   }

//   void toggleCheck(int index) {
//     print('gooooooksdjasdjasjdla');
//     for (var i = 0; i < _shoeSizes.length; i++) {
//       if (i == index) {
//         _shoeSizes[i]['isSelected'] = !_shoeSizes[i]['isSelected'];
//       }
//     }
//     print(_shoeSizes);
//     notifyListeners();
//   }

//   List<String> get sizes => _sizes;

//   set sizes(List<String> newSizes) {
//     _sizes = newSizes;
//     print("Hola tallas");
//     print(_sizes.toString());
//     print(_shoeSizes);
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier {
  int _activepage = 0;
  List<dynamic> _shoeSizes = [];
  List<String> _sizes = [];

  int get activepage => _activepage;

  set activePage(int newIndex) {
    print(_activepage);
    _activepage = newIndex;
    notifyListeners();
  }

  List<dynamic> get shoeeSizes => _shoeSizes;

  set shoesSizes(List<dynamic> newSizes) {
    _shoeSizes = newSizes;
    print("imprimir tallas");
    print(_shoeSizes);
    print("fin tallas");
    notifyListeners();
  }

//  function is called with an index, it will toggle the selection
// of that item and leave the selection of all other items as they were.
// This will allow for multiple items to be selected at once.

  void toggleCheck() {
    // for (int i = 0; i < _shoeSizes.length; i++) {
    //   if (i == index) {
    //     _shoeSizes[i]['isSelected'] = !_shoeSizes[i]['isSelected'];
    //   }
    // }
    notifyListeners();
  }

  List<String> get sizes => _sizes;

  set sizes(List<String> newSizes) {
    _sizes = newSizes;
    notifyListeners();
  }
}
