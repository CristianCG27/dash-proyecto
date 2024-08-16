import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/producto.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductsProvider extends ChangeNotifier {
  List<Producto> male = [];
  List<Producto> female = [];
  List<Producto> kids = [];

  List<Categoria> categorias = [];
  bool isLoading = true;

  Future<List<Producto>> getAllProducts() async {
    final resp = await http.get(Uri.parse('http://localhost:8080/api/productos'));
    //print(resp);

    isLoading = false;
    notifyListeners();
    List<dynamic> data = jsonDecode(resp.body);

    return data.map((json) => Producto.fromJson(json)).toList();
  }

  Future<List<Producto>> getMaleProducts() async {
    final resp = await CafeApi.httpGetinicio('/productos');
    final maleList = productoFromJson(resp);

    var male = maleList.where((element) => element.productoPara == "hombre");
    isLoading = false;
    notifyListeners();
    return male.toList();
  }

  Future<Producto?> getMaleProductById(String id) async {
    try {
      final resp = await CafeApi.httpGet('/productos/$id');

      var producto = Producto.fromJson(resp);

      return producto;
    } catch (e) {
      return null;
    }
  }

  Future<List<Producto>> getfeMaleProducts() async {
    final resp = await CafeApi.httpGetinicio('/productos');
    final femaleList = productoFromJson(resp);

    var female = femaleList.where((element) => element.productoPara == "mujer");
    isLoading = false;
    notifyListeners();
    return female.toList();
  }

  Future<Producto?> getfeMaleProductById(String id) async {
    try {
      final resp = await CafeApi.httpGet('/productos/$id');

      var producto = Producto.fromJson(resp);

      return producto;
    } catch (e) {
      return null;
    }
  }

  Future<List<Producto>> getKidsProducts() async {
    final resp = await CafeApi.httpGetinicio('/productos');
    final kidsList = productoFromJson(resp);

    var kids = kidsList.where((element) => element.productoPara == "nino");
    isLoading = false;
    notifyListeners();
    return kids.toList();
  }

  Future<Producto?> getKidsProductById(String id) async {
    try {
      final resp = await CafeApi.httpGet('/productos/$id');

      var producto = Producto.fromJson(resp);

      return producto;
    } catch (e) {
      return null;
    }
  }

  /// Product View Buttons

  Future<void> updatePosition(int n) async {
    print("El valor de n es: ");
    print(n);
    print(".........");

    final url = Uri.parse('http://localhost:8080/api/productos/update-positions/0');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: '{"n": $n}',
      );

      if (response.statusCode == 200) {
        print('Posiciones actualizadas correctamente.');
      } else {
        print('Error en la actualización: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> venderProducto(String productoId, String tallaId) async {
    final url = Uri.parse('http://localhost:8080/api/productos/$productoId/vender/$tallaId');

    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'productoId': productoId, 'tallaId': tallaId}),
    );

    if (response.statusCode == 200) {
      print('Venta exitosa');
    } else {
      print('Error en la venta: ${response.body}');
    }
  }

  Future<void> updateAnaquel(String productoId, String tallaId, bool inEstante) async {
    print("El valor en provider: ");
    print('$productoId ,   $tallaId,    $inEstante');
    print(".........");

    final url = Uri.parse('http://localhost:8080/api/productos/update-anaquel/5');
    
    try {

      final body = jsonEncode({
      'id': productoId,
      'idTalla': tallaId,
      'inEstante': inEstante,
    });


      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print('Anaquel Actualizado');
      } else {
        print('Error en la actualización del anaquel: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}






// final productsList = productoFromJson(resp);
    // print(object)

    // isLoading = false;
    // notifyListeners();
    // return productsList.toList();
    //final productsList = productoFromJson(resp);

    // List<dynamic> data = jsonDecode(resp.body);
    // isLoading = false;
    // //notifyListeners();
    // return data.map((item) => Producto.fromJson(item)).toList();

    // // isLoading = false;
    // // notifyListeners();
    // // //return productsList.toList();






    // final data = {
    //   'n': n
    // };
    

    // try {
    //   await CafeApi.put('/productos/update-positions/3', data);

    //   notifyListeners();
    // } catch (e) {
    //   print('Error al modificar');
    //   print(e);
    //   throw 'Error al modificar categoria';
    // }
  //}

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