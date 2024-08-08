// import 'dart:convert';

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
//   List<dynamic> tallasJson = jsonMap['tallas'];
//   List<Talla> tallas = tallasJson.map((tallaJson) => Talla.fromJson(tallaJson)).toList();

//   // Imprimir solo la propiedad talla de cada objeto Talla
//   tallas.forEach((talla) {
//     print('Talla: ${talla.talla}');
//   });
// }

// class Talla {
//   String id;
//   String talla;
//   bool isSelected;

//   Talla({required this.id, required this.talla, required this.isSelected});

//   factory Talla.fromJson(Map<String, dynamic> json) {
//     return Talla(
//       id: json['_id'],
//       talla: json['talla'],
//       isSelected: json['isSelected'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'talla': talla,
//       'isSelected': isSelected,
//     };
//   }

//   @override
//   String toString() {
//     return 'Talla{id: $id, talla: $talla, isSelected: $isSelected}';
//   }
// }