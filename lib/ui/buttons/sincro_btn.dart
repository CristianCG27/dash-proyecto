import 'package:admin_dashboard/providers/products_provider_old.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/data_provider.dart';
import 'package:admin_dashboard/ui/shared/style/appstyle.dart';
import 'package:admin_dashboard/ui/shared/Widgets/charging_overlay.dart';
import 'package:admin_dashboard/providers/esp82_provider.dart';

class SincroBtn extends StatelessWidget {
  const SincroBtn({Key? key, required this.label}) : super(key: key);

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
          onTap: () {
            ProductsProvider productsProvider = ProductsProvider();
            productsProvider.sincronizarBD();
            //turnOnLed(30000); // Utilizar el tiempo de DataProvider
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
