import 'dart:convert';

class Posicion {
  final int px;
  final int py;
  final String id;

  Posicion({
    required this.px,
    required this.py,
    required this.id,
  });

  factory Posicion.fromRawJson(String str) => Posicion.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

  factory Posicion.fromJson(Map<String, dynamic> json) => Posicion(
        px: json["px"],
        py: json["py"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "px": px,
        "py": py,
        "_id": id,
      };

  @override
  String toString() {
    return '$px , $py';
  }

  

  // String toStringI(int index) {

  //   if(index == 0){
  //     return '$px';

  //   }
  //   else if(index == 1){
  //     return '$py';
  //   }
  //   else{
  //     return 'posicion { px: $px, py: $py ';
  //   }
  // }
}
