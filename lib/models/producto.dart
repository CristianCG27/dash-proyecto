import 'dart:convert';

List<Producto> productoFromJson(String str) =>
    List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));
String productoToJson(List<Producto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
  final String id;
  final String name;
  final String category;
  final List<String> imageUrl;
  final String oldPrice;
  final List<dynamic> sizes;
  final String price;
  final String description;
  final String title;

  Producto({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.oldPrice,
    required this.sizes,
    required this.price,
    required this.description,
    required this.title,
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        oldPrice: json["oldPrice"],
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
        price: json["price"],
        description: json["description"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
        "oldPrice": oldPrice,
        "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
        "price": price,
        "description": description,
        "title": title,
      };
}

























// // To parse this JSON data, do
// //
// //     final producto = productoFromJson(jsonString);

// import 'dart:convert';

// List<Producto> productoFromJson(String str) =>
//     List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

// //String productoToJson(List<Producto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Producto {
//   final String id;
//   final String nombre;
//   final Usuario? usuario;
//   final int precio;
//   final String categoria; //cambio dynamic
//   final bool? disponible;
//   final List<String> img;
//   final List<dynamic> tallas;
//   final List<String>? posicion;
//   final String? descripcion;

//   Producto({
//     required this.id,
//     required this.nombre,
//     this.usuario,
//     required this.precio,
//     required this.categoria,
//     this.disponible,
//     required this.img,
//     required this.tallas,
//     this.posicion,
//     this.descripcion,
//   });

//   factory Producto.fromJson(Map<String, dynamic> json) => Producto(
//         id: json["_id"],
//         nombre: json["nombre"],
//         usuario: Usuario.fromJson(json["usuario"]),
//         precio: json["precio"],
//         categoria: json["categoria"],
//         disponible: json["disponible"],
//         img: json["img"],
//         tallas: List<dynamic>.from(json["tallas"].map((x) => x)),
//         posicion: List<String>.from(json["posicion"].map((x) => x)),
//         descripcion: json["descripcion"],
//       );

//   // Map<String, dynamic> toJson() => {
//   //     "_id": id,
//   //     "nombre": nombre,
//   //     "usuario": usuario.toJson(),
//   //     "precio": precio,
//   //     "categoria": categoria,
//   //     "disponible": disponible,
//   //     "img": img,
//   //     "tallas": List<dynamic>.from(tallas.map((x) => x)),
//   //     "posicion": List<dynamic>.from(posicion.map((x) => x)),
//   //     "descripcion": descripcion,
//   // };
// }

// class Usuario {
//   final String id;
//   final String nombre;

//   Usuario({
//     required this.id,
//     required this.nombre,
//   });

//   factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
//         id: json["_id"],
//         nombre: json["nombre"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "nombre": nombre,
//       };
// }




//--------------------------------------------------------------------------------------

//FROM MAP

// To parse this JSON data, do
//
//     final producto = productoFromMap(jsonString);

/*

import 'package:meta/meta.dart';
import 'dart:convert';

List<Producto> productoFromMap(String str) => List<Producto>.from(json.decode(str).map((x) => Producto.fromMap(x)));

String productoToMap(List<Producto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Producto {
    final String id;
    final String nombre;
    final Usuario usuario;
    final int precio;
    final dynamic categoria;
    final bool disponible;
    final String img;
    final List<dynamic> tallas;
    final List<dynamic> posicion;
    final String descripcion;

    Producto({
        required this.id,
        required this.nombre,
        required this.usuario,
        required this.precio,
        required this.categoria,
        required this.disponible,
        required this.img,
        required this.tallas,
        required this.posicion,
        required this.descripcion,
    });

    factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: Usuario.fromMap(json["usuario"]),
        precio: json["precio"],
        categoria: json["categoria"],
        disponible: json["disponible"],
        img: json["img"],
        tallas: List<dynamic>.from(json["tallas"].map((x) => x)),
        posicion: List<dynamic>.from(json["posicion"].map((x) => x)),
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario.toMap(),
        "precio": precio,
        "categoria": categoria,
        "disponible": disponible,
        "img": img,
        "tallas": List<dynamic>.from(tallas.map((x) => x)),
        "posicion": List<dynamic>.from(posicion.map((x) => x)),
        "descripcion": descripcion,
    };
}

class Usuario {
    final String id;
    final String nombre;

    Usuario({
        required this.id,
        required this.nombre,
    });

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
    };
}

*/