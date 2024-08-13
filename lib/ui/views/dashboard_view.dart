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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import '../cards/white_card.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard View',
                  style: CustomLabels.h1,
                ),
                const SizedBox(height: 10),
                WhiteCard(
                  title: user.nombre,
                  child: Text(user.correo),
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

class MyGrid extends StatelessWidget {
  final int rows = 10;
  final int columns = 4;

  @override
  Widget build(BuildContext context) {
    // Calcular el tamaño de las celdas en función de la pantalla y del número de filas/columnas
    double cellWidth = MediaQuery.of(context).size.width * 0.5 / columns;
    double cellHeight = MediaQuery.of(context).size.height / rows;
    double aspectRatio = cellWidth / cellHeight;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        //physics: NeverScrollableScrollPhysics(), // Desactivar el scroll
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns, // Número de columnas (4)
          childAspectRatio: aspectRatio, // Relación de aspecto ajustada dinámicamente
          crossAxisSpacing: 4, // Espacio horizontal entre celdas
          mainAxisSpacing: 4, // Espacio vertical entre celdas
        ),
        itemCount: rows * columns, // Total de celdas (10 x 4 = 40)
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 13, 17, 22),
                  Color.fromARGB(255, 29, 37, 49),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const GridTile(
                child: Center(
              child: Text(
                "1",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            )),
          );
        },
      ),
    );
  }
}
