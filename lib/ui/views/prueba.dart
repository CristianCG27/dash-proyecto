// import 'package:flutter/material.dart';
// import 'dart:convert';

// class ShoeSizeSelector extends StatefulWidget {
//   final List<Talla> tallas;

//   ShoeSizeSelector({required this.tallas});

//   @override
//   _ShoeSizeSelectorState createState() => _ShoeSizeSelectorState();
// }

// class _ShoeSizeSelectorState extends State<ShoeSizeSelector> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: widget.tallas.map((talla) {
//         return GestureDetector(
//           onTap: () {
//             setState(() {
//               for (var t in widget.tallas) {
//                 t.isSelected = false;
//               }
//               talla.isSelected = true;
//             });
//           },
//           child: Container(
//             margin: EdgeInsets.symmetric(horizontal: 8.0),
//             padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//             decoration: BoxDecoration(
//               color: talla.isSelected ? Colors.blue : Colors.white,
//               borderRadius: BorderRadius.circular(5.0),
//               border: Border.all(color: Colors.blue),
//             ),
//             child: Text(
//               talla.talla,
//               style: TextStyle(
//                 color: talla.isSelected ? Colors.white : Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }