// To parse this JSON data, do
//
//     final categoryListResponse = categoryListResponseFromJson(jsonString);

import 'dart:convert';

List<CategoryListResponse> categoryListResponseFromJson(String str) =>
    List<CategoryListResponse>.from(json.decode(str).map((x) => CategoryListResponse.fromJson(x)));

String categoryListResponseToJson(List<CategoryListResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryListResponse {
  final String id;
  final String nombre;

  CategoryListResponse({
    required this.id,
    required this.nombre,
  });

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) => CategoryListResponse(
        id: json["_id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
      };
}
