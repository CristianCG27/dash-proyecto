// @override
// Widget build(BuildContext context) {
//   return FutureBuilder<List<Zapato>>(
//     future: fetchZapatos(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return Center(child: CircularProgressIndicator());
//       } else if (snapshot.hasError) {
//         return Center(child: Text('Error: ${snapshot.error}'));
//       } else {
//         final zapatos = snapshot.data!;
//         return GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4, // Ajusta según tus necesidades
//             childAspectRatio: 2,
//           ),
//           itemCount: zapatos.length,
//           itemBuilder: (context, index) {
//             final zapato = zapatos[index];
//             return 
//             Column(
//               children: zapato.tallas.map((talla) {
//                 return Container(
//                   margin: EdgeInsets.all(8),
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.blue, Colors.blueAccent],
//                     ),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                       color: Colors.green, // Resaltar con verde si es la tercera fila
//                       width: talla.posiciones.first.py == 3 ? 3 : 1,
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Text('Zapato: ${zapato.nombre}'),
//                       Text('Talla: ${talla.talla}'),
//                       Text('Posición: (${talla.posiciones.first.px}, ${talla.posiciones.first.py})'),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             );
//           },
//         );
//       }
//     },
//   );
// }



//TODO  GRID INICIAL
  // @override
  // Widget build(BuildContext context) {
  //   // Calcular el tamaño de las celdas en función de la pantalla y del número de filas/columnas
  //   double cellWidth = MediaQuery.of(context).size.width * 0.5 / columns;
  //   double cellHeight = MediaQuery.of(context).size.height / rows;
  //   double aspectRatio = cellWidth / cellHeight;

  //   return FutureBuilder<List<Producto>>(
  //     future: _productos,
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Center(child: CircularProgressIndicator());
  //       } else if (snapshot.hasError) {
  //         return Center(child: Text('Error: ${snapshot.error}'));
  //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //         return const Center(child: Text('No hay zapatos disponibles'));
  //       } else {
  //         final producto1 = snapshot.data!;
  //         return Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: GridView.builder(
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: columns, // Número de columnas (4)
  //               childAspectRatio: aspectRatio,
  //               crossAxisSpacing: 4, // Espacio horizontal entre celdas
  //               mainAxisSpacing: 4, // Espacio vertical entre celdas
  //             ),
  //             itemCount: rows * columns, // Total de celdas (10 x 4 = 40)
  //             itemBuilder: (context, index) {
  //               final producto = snapshot.data![index];
  //               print(producto);
  //               bool isThirdRow = index >= (columns * 2) && index < (columns * 3);
  //               return Column(
  //                 children: producto.tallas.map((talla) {
  //                   print(producto.nombre);
  //                   print(talla.talla);
  //                   return Container(
  //                     margin: EdgeInsets.all(8),
  //                     padding: EdgeInsets.all(8),
  //                     decoration: BoxDecoration(
  //                       gradient: LinearGradient(
  //                         colors: [Colors.blue, Colors.blueAccent],
  //                       ),
  //                       borderRadius: BorderRadius.circular(12),
  //                       border: Border.all(
  //                         color: Colors.green, // Resaltar con verde si es la tercera fila
  //                         width: talla.posicion.first.py == 3 ? 3 : 1,
  //                       ),
  //                     ),
  //                     child: Column(
  //                       children: [
  //                         Text('Zapato: ${producto.nombre}'),
  //                         //Text('Talla: ${talla.talla}'),
  //                         //Text('Posición: (${talla.posicion.first.px}, ${talla.posicion.first.py})'),
  //                       ],
  //                     ),
  //                   );
  //                 }).toList(),
  //               );
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //     gradient: const LinearGradient(
                //       colors: [
                //         Color.fromARGB(255, 13, 17, 22),
                //         Color.fromARGB(255, 29, 37, 49),
                //       ],
                //       begin: Alignment.topLeft,
                //       end: Alignment.bottomRight,
                //     ),
                //     border: isThirdRow
                //         ? Border.all(
                //             color: Colors.green, width: 3) // Contorno verde en la tercera fila
                //         : null,
                //   ),
                //   child: GridTile(
                //     child: Center(
                //       child: Text(
                //         //"1",
                //         producto.nombre,
                //         style: const TextStyle(color: Colors.white, fontSize: 13),
                //       ),
                //     ),
                //   ),
                // );
  //             },
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

