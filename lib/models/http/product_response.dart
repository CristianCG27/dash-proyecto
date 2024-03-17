import 'dart:convert';

import 'package:admin_dashboard/models/producto.dart';

class ProductResponse {
  int total;
  List<Producto> productos;

  ProductResponse({
    required this.total,
    required this.productos,
  });

  factory ProductResponse.fromJson(String str) => ProductResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponse.fromMap(Map<String, dynamic> json) => ProductResponse(
        total: json["total"],
        productos: List<Producto>.from(json["usuarios"].map((x) => Producto.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "usuarios": List<dynamic>.from(productos.map((x) => x.toJson())),
      };
}
