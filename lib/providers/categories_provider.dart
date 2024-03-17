import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List categorias = [];

  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResp = CategoriesResponse.fromMap(resp);

    categorias = [...categoriesResp.categorias];

    print(categorias);

    notifyListeners();
  }

  Future newCategory(String nombre) async {
    final data = {
      'nombre': nombre.toUpperCase(),
    };

    try {
      final json = await CafeApi.post('/categorias', data);

      final newCategory = Categoria.fromMap(json);

      categorias.add(newCategory);

      notifyListeners();
    } catch (e) {
      // print('Error al crear');
      // print(e);
      throw 'Error al crear categoria, verifica si ya existe';
    }
  }

  Future updateCategory(String id, String nombre) async {
    final data = {
      'nombre': nombre.toUpperCase(),
    };

    try {
      await CafeApi.put('/categorias/$id', data);

      categorias = categorias.map((category) {
        if (category.id == id) {
          category.nombre = nombre;
        }
        return category;
      }).toList();

      notifyListeners();
    } catch (e) {
      // print('Error al modificar');
      // print(e);
      throw 'Error al modificar categoria';
    }
  }

  Future deleteCategory(String id) async {

    try {
      await CafeApi.delete('/categorias/$id', {});

      categorias.removeWhere((category) => category.id == id);

      notifyListeners();
    } catch (e) {
      // print('Error al modificar');
      // print(e);
      throw 'Error al modificar categoria';
    }
  }
}
