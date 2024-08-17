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
            //turnOnLed(dataModel.tiempo); // Utilizar el tiempo de DataProvider
            ProductsProvider productsProvider = ProductsProvider();
            var posiciond = widget.posicion[0].toJson();
                    int tiempoAct = 0;
                    int posy = posiciond['py'];
                    int pos;
            if (posy == 1) {
                      tiempoAct = 0;
                      //turnOnLed(tiempoAct);
                      var tiempo = tiempoAct / 1000;
                      _showCountdownOverlay(context, tiempo);
                    } else {
                      //tiempoAct = (11 - posy) * 3270;
                      tiempoAct = (11 - posy) * 1000;
                      //turnOnLed(tiempoAct);
                      var tiempo = tiempoAct / 1000;
                      _showCountdownOverlay(context, tiempo);
                    }


            pos = (11 - posy);

            
            productsProvider.updatePosition(pos);
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
