/*import 'dart:convert';

List<Producto> productoFromJson(String str) =>
    List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

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
  final _Usuario usuario;

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
    required this.usuario,
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
        usuario: _Usuario.fromMap(json["usuario"]),
      );
}

// class Producto {
//   String id;
//   String nombre;
//   _Usuario usuario;
//   int precio;
//   dynamic categoria;
//   bool? disponible;
//   String? img;
//   /*
//   ***Revisar img- se hace lista si se tienen varias imagenes por producto
//   ***Se agregan tamaños, descripción, espacio

//   */

//   Producto({
//     required this.id,
//     required this.nombre,
//     required this.usuario,
//     required this.precio,
//     this.categoria,
//     this.disponible,
//     this.img,
//   });

//   factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Producto.fromMap(Map<String, dynamic> json) => Producto(
//         id: json["_id"],
//         nombre: json["nombre"],
//         usuario: _Usuario.fromMap(json["usuario"]),
//         precio: json["precio"],
//         categoria: json["categoria"],
//         disponible: json["disponible"],
//         img: json["img"],
//       );

//   Map<String, dynamic> toMap() => {
//         "_id": id,
//         "nombre": nombre,
//         "usuario": usuario.toMap(),
//         "precio": precio,
//         "categoria": categoria,
//         "disponible": disponible,
//         "img": img,
//       };
// }

class _Usuario {
  String id;
  String nombre;

  _Usuario({
    required this.id,
    required this.nombre,
  });

  factory _Usuario.fromJson(String str) => _Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _Usuario.fromMap(Map<String, dynamic> json) => _Usuario(
        id: json["_id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
      };
}*/
