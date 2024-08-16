import 'package:admin_dashboard/providers/products_provider_old.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/data_provider.dart';
import 'package:admin_dashboard/ui/shared/style/appstyle.dart';
import 'package:admin_dashboard/ui/shared/Widgets/charging_overlay.dart';

import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';

class SellBtn extends StatelessWidget {
  const SellBtn({Key? key, required this.label}) : super(key: key);

  final String label;

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
          onTap: () async {
            //turnOnLed(dataModel.tiempo); // Utilizar el tiempo de DataProvider

            ProductsProvider productsProvider = ProductsProvider();
            print(dataModel.productoId);
            print(dataModel.tallaId);
            productsProvider.venderProducto(dataModel.productoId, dataModel.tallaId);

            //var tiempo = dataModel.tiempo / 1000;
            //_showCountdownOverlay(context, tiempo);

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const Center(
                  child: AlertDialog(
                    title: Text(''),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text(' Procesando la venta...'),
                      ],
                    ),
                  ),
                );
              },
            );
            await Future.delayed(const Duration(seconds: 2));
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const Center(
                  child: AlertDialog(
                    title: Text('Listo'), 
                  ),
                );
              },
            );

            await Future.delayed(const Duration(seconds: 1));

            // Cierra el diálogo
            // ignore: use_build_context_synchronously
            Navigator.of(context).pop();

            NavigationService.replaceTo('/dashboard/productos');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 50,
              width: (MediaQuery.of(context).size.width * 0.7) * 0.35,
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
