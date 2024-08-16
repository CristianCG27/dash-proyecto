// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:admin_dashboard/providers/auth_provider.dart';
// import 'package:admin_dashboard/ui/labels/custom_labels.dart';
// import '../cards/white_card.dart';

// class DashboardView extends StatelessWidget {
//   const DashboardView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<AuthProvider>(context).user!;

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: ListView(
//         physics: const ClampingScrollPhysics(),
//         children: [
//           Text(
//             'Dashboard View',
//             style: CustomLabels.h1,
//           ),
//           const SizedBox(height: 10),
//           WhiteCard(
//             title: user.nombre,
//             child: Text(user.correo),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyGrid extends StatelessWidget {
//   final int rows = 10;
//   final int columns = 4;

//   const MyGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: columns, // Número de columnas (4)
//           childAspectRatio: 1, // Relación de aspecto 1:1 para las celdas
//           crossAxisSpacing: 8, // Espacio horizontal entre celdas
//           mainAxisSpacing: 8, // Espacio vertical entre celdas
//         ),
//         itemCount: rows * columns, // Total de celdas (10 x 4 = 40)
//         itemBuilder: (context, index) {
//           return const Card(
//             color: Colors.blueAccent,
//             child: GridTile(
//               child: Padding(padding: EdgeInsets.all(4.0), child: Text("hbisd")),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:admin_dashboard/providers/auth_provider.dart';
// import 'package:admin_dashboard/ui/labels/custom_labels.dart';
// import '../cards/white_card.dart';

// class DashboardView extends StatelessWidget {
//   const DashboardView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<AuthProvider>(context).user!;

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: ListView(
//         physics: const ClampingScrollPhysics(),
//         children: [
//           Text(
//             'Dashboard View',
//             style: CustomLabels.h1,
//           ),
//           const SizedBox(height: 10),
//           WhiteCard(
//             title: user.nombre,
//             child: Text(user.correo),
//           ),
//           const SizedBox(height: 20),

//           // Aquí se agrega la sección del grid de botones
//           Center(
//             child: AspectRatio(
//               aspectRatio: 2, // Relación de aspecto para que ocupe la mitad de la pantalla
//               child: MyGrid(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyGrid extends StatelessWidget {
//   final int rows = 10;
//   final int columns = 4;

//   @override
//   Widget build(BuildContext context) {
//     // Calcular el tamaño de las celdas en función de la pantalla y del número de filas/columnas
//     double cellWidth = 2 * MediaQuery.of(context).size.width / columns;
//     double cellHeight = MediaQuery.of(context).size.height / rows;
//     double aspectRatio = cellWidth / cellHeight;

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GridView.builder(
//         //physics: NeverScrollableScrollPhysics(), // Desactivar el scroll
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: columns, // Número de columnas (4)
//           childAspectRatio: aspectRatio, // Relación de aspecto ajustada dinámicamente
//           crossAxisSpacing: 2, // Espacio horizontal entre celdas
//           mainAxisSpacing: 2, // Espacio vertical entre celdas
//         ),
//         itemCount: rows * columns, // Total de celdas (10 x 4 = 40)
//         itemBuilder: (context, index) {
//           return const Card(
//             color: Colors.blueAccent,
//             child: GridTile(
//               child: Padding(
//                 padding: EdgeInsets.all(4.0),
//                 child: Text("12"),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:admin_dashboard/models/producto.dart';
import 'package:admin_dashboard/ui/cards/dark_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/providers/products_provider_old.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          // Columna izquierda: Text y WhiteCard
          Expanded(
            flex: 1, // 50% de la pantalla
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard View',
                  style: CustomLabels.h1,
                ),
                const SizedBox(height: 10),
                DarkCard(
                  title: ' Usuario ',
                  child: Text(
                    user.correo,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                const DarkCard(
                  title: ' Quienes somos ',
                  child: Text(
                    'En Zapatos Únicos, nos dedicamos a ofrecer calzado de alta calidad que combina estilo, comodidad y durabilidad. Desde nuestros inicios, hemos trabajado para proporcionar a nuestros clientes una experiencia de compra excepcional, asegurando que cada par de zapatos sea el complemento perfecto para su estilo de vida. Nos enorgullecemos de ofrecer una amplia variedad de modelos que se adaptan a todas las edades y ocasiones, desde el día a día hasta eventos especiales.',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                const DarkCard(
                  title: 'Mision',
                  child: Text(
                    'Nuestra misión es ser la tienda de referencia en el mercado de calzado, ofreciendo productos de calidad superior que satisfagan las necesidades y expectativas de nuestros clientes. Nos comprometemos a mantener un estándar de excelencia en cada aspecto de nuestro negocio, desde la selección de materiales hasta la atención al cliente, con el fin de crear una experiencia de compra única y memorable.',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                const DarkCard(
                  title: 'Vision',
                  child: Text(
                    'Aspiramos a ser reconocidos como líderes en la industria del calzado, expandiendo nuestra presencia a nivel nacional e internacional. Nos esforzamos por innovar constantemente en diseño y tecnología para ofrecer productos que no solo sean estéticamente atractivos, sino también sostenibles y respetuosos con el medio ambiente. Nuestra visión es construir una marca que represente calidad, estilo y responsabilidad social.',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 20), // Espacio entre las dos columnas

          // Columna derecha: Grid
          Expanded(
            flex: 1, // 50% de la pantalla
            child: Container(
              height: MediaQuery.of(context).size.height, // Ocupa toda la altura disponible
              child: AspectRatio(
                aspectRatio: 2, // Relación de aspecto ajustada
                child: MyGrid(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyGrid extends StatefulWidget {
  @override
  State<MyGrid> createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> with TickerProviderStateMixin {
  late Future<List<Producto>> _productos;
  final int rows = 10;
  final int columns = 4;

  void getProducts() {
    _productos = ProductsProvider().getAllProducts();
    //print(_productos);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    double cellWidth = MediaQuery.of(context).size.width * 0.4 / columns;
    double cellHeight = MediaQuery.of(context).size.height / rows;
    double aspectRatio = cellWidth / cellHeight;
    return FutureBuilder<List<Producto>>(
      future: _productos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final zapatos = snapshot.data!;

          // Determinar el tamaño total del grid (máxima posición en px y py)
          int gridWidth = 4; // Ancho del grid (número de columnas)
          int maxPy = zapatos
              .expand((zapato) => zapato.tallas)
              .map((talla) => talla.posicion.first.py)
              .reduce((a, b) => a > b ? a : b);
          int gridHeight = maxPy + 1; // Altura del grid (número de filas)

          // Crear un grid vacío y llenarlo con los elementos en sus posiciones
          List<Widget> gridItems =
              List.generate(gridWidth * gridHeight, (index) => SizedBox.shrink());

          for (var zapato in zapatos) {
            for (var talla in zapato.tallas) {
              int x = talla.posicion.first.px - 1;
              int y = talla.posicion.first.py - 1;

              // Calcular la posición en la lista lineal del grid
              int gridIndex = y * gridWidth + x;

              if (gridIndex < gridItems.length) {
                // Determinar el borde según la fila
                Border border = Border.all(
                  color: (y == 0) ? Colors.green : Colors.transparent, // Rojo para la fila 3
                  width: 3,
                );

                // Reemplazar el widget en la posición calculada
                gridItems[gridIndex] = Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: talla.inEstante
                          ? [
                              const Color.fromARGB(255, 13, 17, 22),
                              const Color.fromARGB(255, 29, 37, 49),
                            ]
                          : [
                              const Color.fromARGB(255, 43, 83, 133),
                              const Color.fromARGB(255, 53, 72, 100),
                            ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: border,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        zapato.nombre,
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      const SizedBox(height: 2),
                      Text(
                          'T: ${talla.talla} ... P: (${talla.posicion.first.px}, ${talla.posicion.first.py})',
                          style: const TextStyle(color: Colors.grey, fontSize: 10)),
                      //const SizedBox(height: 2),
                      // Text('P: (${talla.posicion.first.px}, ${talla.posicion.first.py})',
                      //     style: const TextStyle(color: Colors.grey, fontSize: 10)),
                    ],
                  ),
                );
              } else {
                print('Error: gridIndex $gridIndex fuera del rango');
              }
            }
          }

          return GridView.count(
            crossAxisCount: gridWidth,
            childAspectRatio: aspectRatio,
            // crossAxisSpacing: 4, // Espacio horizontal entre celdas
            // mainAxisSpacing: 4,
            children: gridItems,
          );
        }
      },
    );
  }

  // TODO GRID CASI LISTIO

  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<List<Producto>>(
  //     future: _productos,
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       } else if (snapshot.hasError) {
  //         return Center(child: Text('Error: ${snapshot.error}'));
  //       } else {
  //         final zapatos = snapshot.data!;

  //         // Determinar el tamaño total del grid (máxima posición en px y py)
  //         int gridWidth = 4; // Ancho del grid (número de columnas)
  //         int maxPy = zapatos
  //             .expand((zapato) => zapato.tallas)
  //             .map((talla) => talla.posicion.first.py)
  //             .reduce((a, b) => a > b ? a : b);
  //         int gridHeight = maxPy + 1; // Altura del grid (número de filas)

  //         // Crear un grid vacío y llenarlo con los elementos en sus posiciones
  //         List<Widget> gridItems =
  //             List.generate(gridWidth * gridHeight, (index) => SizedBox.shrink());

  //         for (var zapato in zapatos) {
  //           for (var talla in zapato.tallas) {
  //             int x = talla.posicion.first.px - 1;
  //             int y = talla.posicion.first.py - 1;

  //             // Calcular la posición en la lista lineal del grid
  //             int gridIndex = y * gridWidth + x;

  //             if (gridIndex < gridItems.length) {
  //               // Reemplazar el widget en la posición calculada
  //               gridItems[gridIndex] = Container(
  //                 margin: const EdgeInsets.all(8),
  //                 padding: const EdgeInsets.all(8),
  //                 decoration: BoxDecoration(
  //                   gradient: const LinearGradient(
  //                     colors: [Color.fromARGB(255, 13, 17, 22),
  //                       Color.fromARGB(255, 29, 37, 49),],
  //                   ),
  //                   borderRadius: BorderRadius.circular(12),
  //                   border: Border.all(
  //                     color: Colors.green,
  //                     width: 1,
  //                   ),
  //                 ),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       'Z: ${zapato.nombre}',
  //                       style: TextStyle(fontWeight: FontWeight.bold),
  //                     ),
  //                     const SizedBox(height: 3),
  //                     Text('T: ${talla.talla}'),
  //                     const SizedBox(height: 3),
  //                     Text('P: (${talla.posicion.first.px}, ${talla.posicion.first.py})'),
  //                   ],
  //                 ),
  //               );
  //             } else {
  //               print('Error: gridIndex $gridIndex fuera del rango');
  //             }
  //           }
  //         }

  //         return GridView.count(
  //           crossAxisCount: gridWidth,
  //           children: gridItems,
  //         );
  //       }
  //     },
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<List<Producto>>(
  //     future: _productos,
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       } else if (snapshot.hasError) {
  //         return Center(child: Text('Error: ${snapshot.error}'));
  //       } else {
  //         final zapatos = snapshot.data!;

  //         // Crear una lista que contenga todas las tallas junto con el nombre del zapato
  //         final List<Map<String, dynamic>> tallasList = zapatos.expand((zapato) {
  //           return zapato.tallas.map((talla) {
  //             return {
  //               'zapato': zapato.nombre,
  //               'talla': talla.talla,
  //               'px': talla.posicion.first.px,
  //               'py': talla.posicion.first.py,
  //             };
  //           }).toList();
  //         }).toList();

  //         return GridView.builder(
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 4, // Ajusta según tus necesidades
  //             childAspectRatio: 2, // Ajusta el aspecto si es necesario
  //           ),
  //           itemCount: tallasList.length,
  //           itemBuilder: (context, index) {
  //             final item = tallasList[index];
  //             return Container(
  //               margin: EdgeInsets.all(8),
  //               padding: EdgeInsets.all(8),
  //               decoration: BoxDecoration(
  //                 gradient: LinearGradient(
  //                   colors: [Colors.blue, Colors.blueAccent],
  //                 ),
  //                 borderRadius: BorderRadius.circular(12),
  //                 border: Border.all(
  //                   color: Colors.green,
  //                   width: 1,
  //                 ),
  //               ),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     'Zapato: ${item['zapato']}',
  //                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
  //                   ),
  //                   SizedBox(height: 1),
  //                   Text('Talla: ${item['talla']}'),
  //                   SizedBox(height: 3),
  //                   Text('P: ${item['px']}, ${item['py']}'),
  //                 ],
  //               ),
  //             );
  //           },
  //         );
  //       }
  //     },
  //   );
  // }

  //TODO GRID CON TABLA EN CADA UNO

  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<List<Producto>>(
  //     future: _productos,
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
  //             childAspectRatio: 1, // Ajusta el aspecto si es necesario
  //           ),
  //           itemCount: zapatos.length,
  //           itemBuilder: (context, index) {
  //             final zapato = zapatos[index];
  //             return Container(
  //               margin: EdgeInsets.all(8),
  //               padding: EdgeInsets.all(8),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(12),
  //                 border: Border.all(
  //                   color: Colors.blueAccent,
  //                   width: 2,
  //                 ),
  //               ),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'Zapato: ${zapato.nombre}',
  //                     style: TextStyle(fontWeight: FontWeight.bold),
  //                   ),
  //                   SizedBox(height: 8),
  //                   Wrap(
  //                     spacing: 8.0, // Espacio horizontal entre los elementos
  //                     runSpacing: 8.0, // Espacio vertical entre las filas
  //                     children: zapato.tallas.map((talla) {
  //                       return Container(
  //                         padding: EdgeInsets.all(8),
  //                         decoration: BoxDecoration(
  //                           gradient: LinearGradient(
  //                             colors: [Colors.blue, Colors.blueAccent],
  //                           ),
  //                           borderRadius: BorderRadius.circular(8),
  //                           border: Border.all(
  //                             color: Colors.green, // Resaltar con verde si es la tercera fila
  //                             width: talla.posicion.first.py == 3 ? 3 : 1,
  //                           ),
  //                         ),
  //                         child: Column(
  //                           children: [
  //                             Text('Talla: ${talla.talla}'),
  //                             Text('P: (${talla.posicion.first.px}, ${talla.posicion.first.py})'),
  //                           ],
  //                         ),
  //                       );
  //                     }).toList(),
  //                   ),
  //                 ],
  //               ),
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
  //               // Container(
  //               //   decoration: BoxDecoration(
  //               //     borderRadius: BorderRadius.circular(8),
  //               //     gradient: const LinearGradient(
  //               //       colors: [
  //               //         Color.fromARGB(255, 13, 17, 22),
  //               //         Color.fromARGB(255, 29, 37, 49),
  //               //       ],
  //               //       begin: Alignment.topLeft,
  //               //       end: Alignment.bottomRight,
  //               //     ),
  //               //     border: isThirdRow
  //               //         ? Border.all(
  //               //             color: Colors.green, width: 3) // Contorno verde en la tercera fila
  //               //         : null,
  //               //   ),
  //               //   child: GridTile(
  //               //     child: Center(
  //               //       child: Text(
  //               //         //"1",
  //               //         producto.nombre,
  //               //         style: const TextStyle(color: Colors.white, fontSize: 13),
  //               //       ),
  //               //     ),
  //               //   ),
  //               // );
  //             },
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }
}
