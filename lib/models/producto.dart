// To parse this JSON data, do
//
//     final producto = productoFromJson(jsonString);

import 'dart:convert';
import 'package:admin_dashboard/models/posicion.dart';

List<Producto> productoFromJson(String str) =>
    List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productoToJson(List<Producto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
  final String id;
  final String nombre;
  final String usuario;
  final int precio;
  final String categoria;
  final bool disponible;
  final List<String> img;
  final List<Talla> tallas;
  final String descripcion;
  final String productoPara;

  Producto({
    required this.id,
    required this.nombre,
    required this.usuario,
    required this.precio,
    required this.categoria,
    required this.disponible,
    required this.img,
    required this.tallas,
    required this.descripcion,
    required this.productoPara,
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: json["usuario"],
        precio: json["precio"],
        categoria: json["categoria"],
        disponible: json["disponible"],
        img: List<String>.from(json["img"].map((x) => x)),
        tallas: List<Talla>.from(json["tallas"].map((x) => Talla.fromJson(x))),
        descripcion: json["descripcion"],
        productoPara: json["productoPara"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario,
        "precio": precio,
        "categoria": categoria,
        "disponible": disponible,
        "img": List<dynamic>.from(img.map((x) => x)),
        "tallas": List<dynamic>.from(tallas.map((x) => x.toJson())),
        "descripcion": descripcion,
        "productoPara": productoPara,
      };
}

class Talla {
  final String talla;
  final bool isSelected;
  final List<Posicion> posicion;
  final String id;

  Talla({
    required this.talla,
    required this.isSelected,
    required this.posicion,
    required this.id,
  });

  factory Talla.fromJson(Map<String, dynamic> json) => Talla(
        talla: json["talla"],
        isSelected: json["isSelected"],
        posicion: List<Posicion>.from(json["posicion"].map((x) => Posicion.fromJson(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "talla": talla,
        "isSelected": isSelected,
        "posicion": List<dynamic>.from(posicion.map((x) => x.toJson())),
        "_id": id,
      };
}











// //TODO VERSION ANTERIOR DEL MODELO

// List<Producto> productoFromJson(String str) =>
//     List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

// String productoToJson(List<Producto> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Producto {
//   final String id;
//   final String nombre;
//   final String usuario;
//   final int precio;
//   final String categoria;
//   final bool disponible;
//   final List<String> img;
//   final List<dynamic> tallas;
//   final List<Posicion> posicion;
//   final String descripcion;
//   final String productoPara;

//   Producto({
//     required this.id,
//     required this.nombre,
//     required this.usuario,
//     required this.precio,
//     required this.categoria,
//     required this.disponible,
//     required this.img,
//     required this.tallas,
//     required this.posicion,
//     required this.descripcion,
//     required this.productoPara,
//   });

//   factory Producto.fromJson(Map<String, dynamic> json) => Producto(
//         id: json["_id"],
//         nombre: json["nombre"],
//         usuario: json["usuario"],
//         precio: json["precio"],
//         categoria: json["categoria"],
//         disponible: json["disponible"],
//         img: List<String>.from(json["img"].map((x) => x)),
//         tallas: List<dynamic>.from(json["tallas"].map((x) => Talla.fromJson(x))),
//         posicion: List<Posicion>.from(json["posicion"].map((x) => Posicion.fromJson(x))),
//         descripcion: json["descripcion"],
//         productoPara: json["productoPara"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "nombre": nombre,
//         "usuario": usuario,
//         "precio": precio,
//         "categoria": categoria,
//         "disponible": disponible,
//         "img": List<dynamic>.from(img.map((x) => x)),
//         "tallas": List<dynamic>.from(tallas.map((x) => x.toJson())),
//         "posicion": List<dynamic>.from(posicion.map((x) => x.toJson())),
//         "descripcion": descripcion,
//         "productoPara": productoPara,
//       };
// }

// class Posicion {
//   final String posx;
//   final String posy;
//   final String id;

//   Posicion({
//     required this.posx,
//     required this.posy,
//     required this.id,
//   });

//   factory Posicion.fromJson(Map<String, dynamic> json) => Posicion(
//         posx: json["posx"],
//         posy: json["posy"],
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "posx": posx,
//         "posy": posy,
//         "_id": id,
//       };
// }

// class Talla {
//   final String talla;
//   final bool isSelected;
//   final String id;

//   Talla({
//     required this.talla,
//     required this.isSelected,
//     required this.id,
//   });

//   factory Talla.fromJson(Map<String, dynamic> json) => Talla(
//         talla: json["talla"],
//         isSelected: json["isSelected"],
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "talla": talla,
//         "isSelected": isSelected,
//         "_id": id,
//       };
// }






















































//TODO   aqui se realizo una prueba para las tallas


// List<Talla> tallaFromJson(String str) {
//     Map<String, dynamic> jsonMap = jsonDecode(str);
//     List<dynamic> tallasJson = jsonMap['tallas'];
//     // Extrae la lista de tallas
//     List<Talla> tallas = tallasJson.map((tallaJson) => Talla.fromJson(tallaJson)).toList();
//     // Convierte cada elemento de la lista en un objeto Talla

//     // Imprime las tallas para verificar
//     tallas.forEach((talla) {
//       print('Talla: ${talla.talla}, isSelected: ${talla.isSelected}, ID: ${talla.id}');
//     });

//     return tallas;
//   }

  







// import 'dart:convert';

// class Producto {
//   final String id;
//   final String nombre;
//   final String usuario;
//   final int precio;
//   final String categoria;
//   final bool disponible;
//   final List<String> img;
//   final List<Talla> tallas;
//   final List<Posicion> posicion;
//   final String descripcion;

//   Producto({
//     required this.id,
//     required this.nombre,
//     required this.usuario,
//     required this.precio,
//     required this.categoria,
//     required this.disponible,
//     required this.img,
//     required this.tallas,
//     required this.posicion,
//     required this.descripcion,
//   });

//   factory Producto.fromRawJson(String str) => Producto.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Producto.fromJson(Map<String, dynamic> json) => Producto(
//         id: json["_id"],
//         nombre: json["nombre"],
//         usuario: json["usuario"],
//         precio: json["precio"],
//         categoria: json["categoria"],
//         disponible: json["disponible"],
//         img: List<String>.from(json["img"].map((x) => x)),
//         tallas: List<Talla>.from(json["tallas"].map((x) => Talla.fromJson(x))),
//         posicion: List<Posicion>.from(json["posicion"].map((x) => Posicion.fromJson(x))),
//         descripcion: json["descripcion"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "nombre": nombre,
//         "usuario": usuario,
//         "precio": precio,
//         "categoria": categoria,
//         "disponible": disponible,
//         "img": List<dynamic>.from(img.map((x) => x)),
//         "tallas": List<dynamic>.from(tallas.map((x) => x.toJson())),
//         "posicion": List<dynamic>.from(posicion.map((x) => x.toJson())),
//         "descripcion": descripcion,
//       };
// }

// class Posicion {
//   final String posx;
//   final String posy;
//   final String id;

//   Posicion({
//     required this.posx,
//     required this.posy,
//     required this.id,
//   });

//   factory Posicion.fromRawJson(String str) => Posicion.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Posicion.fromJson(Map<String, dynamic> json) => Posicion(
//         posx: json["posx"],
//         posy: json["posy"],
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "posx": posx,
//         "posy": posy,
//         "_id": id,
//       };
// }

// class Talla {
//   final String talla;
//   final bool isSelected;
//   final String id;

//   Talla({
//     required this.talla,
//     required this.isSelected,
//     required this.id,
//   });

//   factory Talla.fromRawJson(String str) => Talla.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Talla.fromJson(Map<String, dynamic> json) => Talla(
//         talla: json["talla"],
//         isSelected: json["isSelected"],
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "talla": talla,
//         "isSelected": isSelected,
//         "_id": id,
//       };
// }

// To parse this JSON data, do
//
//     final producto = productoFromJson(jsonString);

// import 'dart:convert';

// List<Producto> productoFromJson(String str) => List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

// String productoToJson(List<Producto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Producto {
//     final String id;
//     final String nombre;
//     final String usuario;
//     final int precio;
//     final String categoria;
//     final bool disponible;
//     final List<String> img;
//     final List<Talla> tallas;
//     final List<Posicion> posicion;
//     final String descripcion;

//     Producto({
//         required this.id,
//         required this.nombre,
//         required this.usuario,
//         required this.precio,
//         required this.categoria,
//         required this.disponible,
//         required this.img,
//         required this.tallas,
//         required this.posicion,
//         required this.descripcion,
//     });

//     factory Producto.fromJson(Map<String, dynamic> json) => Producto(
//         id: json["_id"],
//         nombre: json["nombre"],
//         usuario: json["usuario"],
//         precio: json["precio"],
//         categoria: json["categoria"],
//         disponible: json["disponible"],
//         img: List<String>.from(json["img"].map((x) => x)),
//         tallas: List<Talla>.from(json["tallas"].map((x) => Talla.fromJson(x))),
//         posicion: List<Posicion>.from(json["posicion"].map((x) => Posicion.fromJson(x))),
//         descripcion: json["descripcion"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "nombre": nombre,
//         "usuario": usuario,
//         "precio": precio,
//         "categoria": categoria,
//         "disponible": disponible,
//         "img": List<dynamic>.from(img.map((x) => x)),
//         "tallas": List<dynamic>.from(tallas.map((x) => x.toJson())),
//         "posicion": List<dynamic>.from(posicion.map((x) => x.toJson())),
//         "descripcion": descripcion,
//     };
// }

// class Posicion {
//     final String posx;
//     final String posy;

//     Posicion({
//         required this.posx,
//         required this.posy,
//     });

//     factory Posicion.fromJson(Map<String, dynamic> json) => Posicion(
//         posx: json["posx"],
//         posy: json["posy"],
//     );

//     Map<String, dynamic> toJson() => {
//         "posx": posx,
//         "posy": posy,
//     };
// }

// class Talla {
//     final String talla;
//     final bool isSelected;

//     Talla({
//         required this.talla,
//         required this.isSelected,
//     });

//     factory Talla.fromJson(Map<String, dynamic> json) => Talla(
//         talla: json["talla"],
//         isSelected: json["isSelected"],
//     );

//     Map<String, dynamic> toJson() => {
//         "talla": talla,
//         "isSelected": isSelected,
//     };
// }

//TODO MAPPP// To parse this JSON data, do
//
//     final producto = productoFromMap(jsonString);
// import 'package:meta/meta.dart';
// import 'dart:convert';

// class Producto {
//   final String id;
//   final String nombre;
//   final String usuario;
//   final int precio;
//   final String categoria;
//   final bool disponible;
//   final List<String> img;
//   final List<dynamic> tallas;
//   final List<Posicion> posicion;
//   final String descripcion;

//   Producto({
//     required this.id,
//     required this.nombre,
//     required this.usuario,
//     required this.precio,
//     required this.categoria,
//     required this.disponible,
//     required this.img,
//     required this.tallas,
//     required this.posicion,
//     required this.descripcion,
//   });

//   factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Producto.fromMap(Map<String, dynamic> json) => Producto(
//         id: json["_id"],
//         nombre: json["nombre"],
//         usuario: json["usuario"],
//         precio: json["precio"],
//         categoria: json["categoria"],
//         disponible: json["disponible"],
//         img: List<String>.from(json["img"].map((x) => x)),
//         tallas: List<dynamic>.from(json["tallas"].map((x) => Talla.fromMap(x))),
//         posicion: List<Posicion>.from(json["posicion"].map((x) => Posicion.fromMap(x))),
//         descripcion: json["descripcion"],
//       );

//   Map<String, dynamic> toMap() => {
//         "_id": id,
//         "nombre": nombre,
//         "usuario": usuario,
//         "precio": precio,
//         "categoria": categoria,
//         "disponible": disponible,
//         "img": List<dynamic>.from(img.map((x) => x)),
//         "tallas": List<dynamic>.from(tallas.map((x) => x.toMap())),
//         "posicion": List<dynamic>.from(posicion.map((x) => x.toMap())),
//         "descripcion": descripcion,
//       };
// }

// class Posicion {
//   final String posx;
//   final String posy;
//   final String id;

//   Posicion({
//     required this.posx,
//     required this.posy,
//     required this.id,
//   });

//   factory Posicion.fromJson(String str) => Posicion.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Posicion.fromMap(Map<String, dynamic> json) => Posicion(
//         posx: json["posx"],
//         posy: json["posy"],
//         id: json["_id"],
//       );

//   Map<String, dynamic> toMap() => {
//         "posx": posx,
//         "posy": posy,
//         "_id": id,
//       };
// }

// class Talla {
//   final String talla;
//   final bool isSelected;
//   final String id;

//   Talla({
//     required this.talla,
//     required this.isSelected,
//     required this.id,
//   });

//   factory Talla.fromJson(String str) => Talla.fromMap(json.decode(str));

//   //String toJson() => json.encode(toMap());

//   factory Talla.fromMap(Map<String, dynamic> json) => Talla(
//         talla: json["talla"],
//         isSelected: json["isSelected"],
//         id: json["_id"],
//       );

//   Map<String, dynamic> toMap() => {
//         "talla": talla,
//         "isSelected": isSelected,
//         "_id": id,
//       };
// }

//todo









// import 'dart:convert';

// List<Producto> productoFromJson(String str) =>
//     List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));
// String productoToJson(List<Producto> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Producto {
//   final String id;
//   final String name;
//   final String category;
//   final List<String> imageUrl;
//   final String oldPrice;
//   final List<dynamic> sizes;
//   final String price;
//   final String description;
//   final String title;

//   Producto({
//     required this.id,
//     required this.name,
//     required this.category,
//     required this.imageUrl,
//     required this.oldPrice,
//     required this.sizes,
//     required this.price,
//     required this.description,
//     required this.title,
//   });

//   factory Producto.fromJson(Map<String, dynamic> json) => Producto(
//         id: json["id"],
//         name: json["name"],
//         category: json["category"],
//         imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
//         oldPrice: json["oldPrice"],
//         sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
//         price: json["price"],
//         description: json["description"],
//         title: json["title"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "category": category,
//         "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
//         "oldPrice": oldPrice,
//         "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
//         "price": price,
//         "description": description,
//         "title": title,
//       };
// }

























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