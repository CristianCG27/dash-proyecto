import 'dart:convert';

import '../category.dart';

class CategoriesResponse {
  int total;
  List<Categoria> categorias;

  CategoriesResponse({
    required this.total,
    required this.categorias,
  });

  factory CategoriesResponse.fromJson(String str) =>
      CategoriesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriesResponse.fromMap(Map<String, dynamic> json) =>
      CategoriesResponse(
        total: json["total"],
        categorias: List<Categoria>.from(
            json["categorias"].map((x) => Categoria.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "categorias": List<dynamic>.from(categorias.map((x) => x.toMap())),
      };
}
