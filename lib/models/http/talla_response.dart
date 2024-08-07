import 'dart:convert';
import 'package:admin_dashboard/models/talla121212.dart';

// void main() {
//   String jsonStr = '''{
//     "_id": "669a1a8fdd2d29e318054de4",
//     "nombre": "NIKE SB DUNK LOW PRO AA",
//     "usuario": "6563c74a34d667b1e82610a6",
//     "precio": 2799,
//     "categoria": "65f78a4ee9fefa5400d4c618",
//     "disponible": true,
//     "img": [
//       "https://res.cloudinary.com/ddgbo8f6k/image/upload/v1721375296/calzado-de-skateboarding-sb-dunk-low-pro-aa-mDqKWF_2_hs6zvx.webp",
//       "https://res.cloudinary.com/ddgbo8f6k/image/upload/v1721375293/calzado-de-skateboarding-sb-dunk-low-pro-aa-mDqKWF_1_l9orc2.webp",
//       "https://res.cloudinary.com/ddgbo8f6k/image/upload/v1721375300/calzado-de-skateboarding-sb-dunk-low-pro-aa-mDqKWF_vtnxjf.webp"
//     ],
//     "tallas": [
//       {
//         "talla": "5.0",
//         "isSelected": false,
//         "_id": "669a1a8fdd2d29e318054de5"
//       },
//       {
//         "talla": "5.5",
//         "isSelected": false,
//         "_id": "669a1a8fdd2d29e318054de6"
//       },
//       {
//         "talla": "6.0",
//         "isSelected": false,
//         "_id": "669a1a8fdd2d29e318054de7"
//       }
//     ],
//     "descripcion": "El clásico calzado de skateboarding perfecto para el skate y mucho más.",
//     "productoPara": "hombre"
//   }''';

//   Map<String, dynamic> jsonMap = jsonDecode(jsonStr);

//   // Extrae la lista de tallas
//   List<dynamic> tallasJson = jsonMap['tallas'];

//   // Convierte cada elemento de la lista en un objeto Talla
//   List<Talla> tallas = tallasJson.map((tallaJson) => Talla.fromJson(tallaJson)).toList();

//   // Imprime las tallas para verificar
//   tallas.forEach((talla) {
//     print('Talla: ${talla.talla}, isSelected: ${talla.isSelected}, ID: ${talla.id}');
//   });
// }




// To parse this JSON data, do
//
//     final tallasResponse = tallasResponseFromJson(jsonString);

// TallasResponse tallasResponseFromJson(String str) => TallasResponse.fromJson(json.decode(str));

// String tallasResponseToJson(TallasResponse data) => json.encode(data.toJson());

// class TallasResponse {
//     final List<Talla> tallas;

//     TallasResponse({
//         required this.tallas,
//     });

//     factory TallasResponse.fromJson(Map<String, dynamic> json) => TallasResponse(
//         tallas: List<Talla>.from(json["tallas"].map((x) => Talla.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "tallas": List<dynamic>.from(tallas.map((x) => x.toJson())),
//     };

//     TallasResponse.forEach((talla) {
//     print('Talla: ${talla.talla}, isSelected: ${talla.isSelected}, ID: ${talla.id}');
//   });
// }


