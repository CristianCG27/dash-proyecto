import 'package:admin_dashboard/providers/products_provider_old.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/data_provider.dart';
import 'package:admin_dashboard/ui/shared/style/appstyle.dart';
import 'package:admin_dashboard/ui/shared/Widgets/charging_overlay.dart';

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
          onTap: () {
            //turnOnLed(dataModel.tiempo); // Utilizar el tiempo de DataProvider
            //ProductsProvider productsProvider = ProductsProvider();
            //print(dataModel.pos);
            //productsProvider.updatePosition(dataModel.pos);
            //var tiempo = dataModel.tiempo / 1000;
            //_showCountdownOverlay(context, tiempo);
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
