import 'package:admin_dashboard/models/producto.dart';
import 'package:flutter/services.dart';

import 'package:collection/collection.dart';
//TODO: Modificacion de sneakerFromJson(data);

class Helper {
  // Future<List<Producto>> getMaleSneakers() async {
  //   final data = await rootBundle.loadString("assets/json/men_shoes.json");
  //   //print(data);
  //   //print('hola male');
  //   final maleList = productoFromJson(data);
  //   //print('adios male');
  //   //print(maleList);

  //   return maleList;
  // }

  Future<List<Producto>> getFemaleSneakers() async {
    final data = await rootBundle.loadString("assets/json/women_shoes.json");
    final femaleList = productoFromJson(data);

    return femaleList;
  }

  Future<List<Producto>> getKidsSneakers() async {
    final data = await rootBundle.loadString("assets/json/kids_shoes.json");
    final kidsList = productoFromJson(data);

    return kidsList;
  }

//Single sneaker

  Future<Producto?> getMaleSneakersById(String id) async {
    final data = await rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = productoFromJson(data);

    final producto = maleList.firstWhereOrNull((producto) => producto.id == id);
    return producto;
  }

  Future<Producto?> getFemaleSneakersById(String id) async {
    final data = await rootBundle.loadString("assets/json/women_shoes.json");
    final femaleList = productoFromJson(data);

    final producto = femaleList.firstWhereOrNull((producto) => producto.id == id);
    return producto;
  }

  Future<Producto?> getKidsSneakersById(String id) async {
    final data = await rootBundle.loadString("assets/json/kids_shoes.json");
    final kidsList = productoFromJson(data);

    final producto = kidsList.firstWhereOrNull((producto) => producto.id == id);
    return producto;
  }
}
