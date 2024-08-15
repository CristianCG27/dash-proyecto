// import 'package:admin_dashboard/providers/data_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:admin_dashboard/ui/shared/style/appstyle.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// class OrderBtn extends StatelessWidget {
//   const OrderBtn({super.key, required this.label, required this.time});

//   final String espUrl = 'http://192.168.137.234';
//   final String label;
//   final int time;

//   Future<void> turnOnLed(int timeInMillis) async {
//     try {
//       final url = 'http://192.168.137.9/on?time=$timeInMillis'; // Reemplaza con la IP del ESP8266
//       final response = await http.get(Uri.parse(url));
//       //print('Respuesta del servidor: ${response.body}');

//       if (response.statusCode == 200) {
//         print('encendido');
//         print('Respuesta del servidor: ${response.body}');
//       } else {
//         print('Error en la solicitud, código: ${response.statusCode}');
//         print("Verifica");
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DataProvider>(
//       builder: (context, dataModel, child) {
//         return GestureDetector(
//           onTap: () {
//             turnOnLed(dataModel.tiempo);
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 80),
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.all(Radius.circular(12)),
//               ),
//               height: 50,
//               width: MediaQuery.of(context).size.width * 0.5,
//               child: Center(
//                 child: Text(
//                   label,
//                   style: appstyle(20, Colors.white, FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );

//     ////////////////
//   }
// }

import 'package:admin_dashboard/providers/products_provider_old.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/data_provider.dart';
import 'package:admin_dashboard/ui/shared/style/appstyle.dart';
import 'package:admin_dashboard/ui/shared/Widgets/charging_overlay.dart';

class OrderBtn extends StatelessWidget {
  const OrderBtn({Key? key, required this.label}) : super(key: key);

  final String label;

  /// URL base del ESP8266
  final String espUrl = 'http://192.168.137.198';

  /// Enciende el LED en el ESP8266 durante el tiempo especificado
  Future<void> turnOnLed(int timeInMillis) async {
    final url = '$espUrl/on?time=$timeInMillis'; // Construir la URL completa

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print('LED encendido con éxito');
        print('Respuesta del servidor: ${response.body}');
      } else {
        print('Error en la solicitud: Código ${response.statusCode}');
      }
    } catch (e) {
      print('Error de conexión: $e');
    }
  }

  void _showCountdownOverlay(BuildContext context, double tiempo) {
    showDialog(
      context: context,
      barrierDismissible: false, // Evita que el diálogo se cierre al hacer clic fuera
      builder: (BuildContext context) {
        return ChargingOverlay(tiempo: tiempo);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataModel, child) {
        return GestureDetector(
          onTap: () {
            //turnOnLed(dataModel.tiempo); // Utilizar el tiempo de DataProvider
            ProductsProvider productsProvider = ProductsProvider();
            print(dataModel.pos);
            productsProvider.updatePosition(dataModel.pos);
            var tiempo = dataModel.tiempo / 1000;
            _showCountdownOverlay(context, tiempo);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Center(
                child: Text(
                  label,
                  style: appstyle(20, Colors.white, FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
