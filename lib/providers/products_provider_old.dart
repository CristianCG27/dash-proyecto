import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/product_response.dart';
import 'package:admin_dashboard/models/producto.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  Future<List<Producto>> getMaleProducts() async {
    final resp = await CafeApi.httpGet('/productos');
    final productResp = ProductResponse.fromJson(resp);

    if (resp.statusCode == 200) {
      var productos = [...productResp.productos];
      //var productos = productoFromJson(productResp.);
      var male = productos.where((element) => element.category == "Men's Running");
      return male.toList();
    } else {
      throw Exception('Failed to load jobs list');
    }
  }
}



// class ProductProvider extends ChangeNotifier {
//   List<Producto> productos = [];
//   bool isLoading = true;
//   bool ascending = true;
//   int? sortColumIndex;

//   ProductProvider() {
//     getPaginatedProducts();
//   }

//   getPaginatedProducts() async {
//     //peticion http

//     final resp = await CafeApi.httpGet('/productos?limite=100&desde=0');
//     final prodResp = ProductResponse.fromMap(resp);

//     productos = [...prodResp.productos];

//     //print(resp);

//     isLoading = false;

//     notifyListeners();
//   }

//   Future<Producto?> getProductById(String id) async {
//     //peticion http

//     try {
//       final resp = await CafeApi.httpGet('/productos/$id');
//       final product = Producto.fromJson(resp);
//       return product;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   // void sort<T>(Comparable<T> Function(Producto producto) getField) {
//   //   productos.sort((a, b) {
//   //     final aValue = getField(a);
//   //     final bValue = getField(b);

//   //     return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
//   //   });
//   //   ascending = !ascending;
//   //   notifyListeners();
//   // }

//   void refreshUsers(Producto newProducto) {
//     productos = productos.map((producto) {
//       if (producto.id == newProducto.id) {
//         producto = newProducto;
//       }
//       return producto;
//     }).toList();

//     notifyListeners();
//   }
// }
















































/*import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/products_respose_old.dart';
import 'package:admin_dashboard/models/product_old.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  List productos = [];

  getProductos() async {
    final resp = await CafeApi.httpGet('/productos');
    final productsResp = ProductsResponse.fromMap(resp);

    productos = [...productsResp.productos];

    print(productos);

    notifyListeners();
  }

  //TODO:  Esto se debe modificar si hay problemas con la categori al crear el producto

  Future newProduct(String nombre, int precio) async {
    final data = {
      'nombre': nombre.toUpperCase(),
      'precio': precio,
    };

    try {
      final json = await CafeApi.post('/productos', data);

      final newProducto = Producto.fromMap(json);
      productos.add(newProducto);

      notifyListeners();
    } catch (e) {
      throw 'Error al crear producto, verifica si ya existe';
    }
  }

  Future updateProducto(String id, String nombre, int precio) async {
    final data = {
      'nombre': nombre.toUpperCase(),
      'precio': precio,
    };

    try {
      await CafeApi.put('/productos/$id', data);

      productos = productos.map((product) {
        if (product.id == id) {
          product.nombre = nombre;
          product.precio = precio;
        }
        return product;
      }).toList();

      notifyListeners();
    } catch (e) {
      // print('Error al modificar');
      // print(e);
      throw 'Error al modificar el producto';
    }
  }

  Future deleteProducto(String id) async {
    try {
      await CafeApi.delete('/producto/$id', {});

      productos.removeWhere((product) => product.id == id);

      notifyListeners();
    } catch (e) {
      // print('Error al modificar');
      // print(e);
      throw 'Error al modificar producto';
    }
  }
}
*/