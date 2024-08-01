
import 'dart:convert';

import 'package:admin_dashboard/models/producto.dart';

// class ProductosResponse {
//     final int total;
//     final List<Producto> productos;

//     ProductosResponse({
//         required this.total,
//         required this.productos,
//     });

//     factory ProductosResponse.fromRawJson(String str) => ProductosResponse.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory ProductosResponse.fromJson(Map<String, dynamic> json) => ProductosResponse(
//         total: json["total"],
//         productos: List<Producto>.from(json["productos"].map((x) => Producto.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "total": total,
//         "productos": List<dynamic>.from(productos.map((x) => x.toJson())),
//     };
// }


//todo JSON

class ProductosResponse {
    final int total;
    final List<Producto> productos;

    ProductosResponse({
        required this.total,
        required this.productos,
    });

    factory ProductosResponse.fromJson(String str) => ProductosResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductosResponse.fromMap(Map<String, dynamic> json) => ProductosResponse(
        total: json["total"],
        productos: List<Producto>.from(json["productos"].map((x) => Producto.fromJson(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "productos": List<dynamic>.from(productos.map((x) => x.toJson())),
    };
}
