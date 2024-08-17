import 'package:admin_dashboard/models/posicion.dart';
import 'package:admin_dashboard/providers/data_provider.dart';
import 'package:admin_dashboard/providers/esp82_provider.dart';
import 'package:admin_dashboard/ui/shared/Widgets/charging_overlay.dart';

import 'package:admin_dashboard/providers/products_provider_old.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomRetornSelect extends StatefulWidget {
  CustomRetornSelect(
      {super.key,
      required this.posicion,
      required this.isSelected,
      required this.productId,
      required this.tallaId,
      required this.existencia,
      required this.estante});
  final List<Posicion> posicion;
  final String productId;
  final String tallaId;
  final bool existencia;
  final bool estante;
  bool isSelected;

  @override
  State<CustomRetornSelect> createState() => _CustomRetornSelectState();
}

class _CustomRetornSelectState extends State<CustomRetornSelect> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: GestureDetector(
        onTap: widget.existencia
            ? widget.estante
                ? null
                : () {
                    ProductsProvider productsProvider = ProductsProvider();
                    var posiciond = widget.posicion[0].toJson();
                    int tiempoAct = 0;
                    int posy = posiciond['py'];
                    int pos;
                    int posx = posiciond['px'];

                    if (posy == 1) {
                      tiempoAct = 0;
                      turnOnLed(tiempoAct);
                      turnOnPx(posx);
                      var tiempo = tiempoAct / 1000;
                      _showCountdownOverlay(context, tiempo);
                    } else {
                      //tiempoAct = (11 - posy) * 3270;
                      tiempoAct = (11 - posy) * 1000;
                      turnOnLed(tiempoAct);
                      turnOnPx(posx);
                      var tiempo = tiempoAct / 1000;
                      _showCountdownOverlay(context, tiempo);
                    }
                    pos = (11 - posy);

                    productsProvider.updatePosition(pos);
                    productsProvider.updateAnaquel(widget.productId, widget.tallaId, true);

                    //Provider.of<DataProvider>(context, listen: false).updatePos(pos);
                  }
            : null,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 3.0),
          decoration: BoxDecoration(
            color: widget.existencia
                ? widget.estante
                    ? const Color.fromARGB(255, 255, 248, 248)
                    : const Color.fromARGB(255, 0, 255, 8)
                : Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: widget.existencia
                    ? widget.estante
                        ? Colors.white
                        : const Color.fromARGB(255, 0, 49, 2)
                    : Colors.white),
          ),
          child: Text(
            "Regresar",
            style: TextStyle(
              fontSize: 10,
              color: widget.existencia
                  ? widget.estante
                      ? Colors.white
                      : const Color.fromARGB(255, 21, 71, 28)
                  : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
