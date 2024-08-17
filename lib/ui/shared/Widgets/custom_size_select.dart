import 'package:admin_dashboard/models/posicion.dart';
import 'package:admin_dashboard/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomSizeSelect extends StatefulWidget {
  CustomSizeSelect(
      {super.key,
      required this.talla,
      required this.posicion,
      required this.isSelected,
      required this.productId,
      required this.tallaId,
      required this.existencia,
      required this.estante});
  final String talla;
  final List<Posicion> posicion;
  final String productId;
  final String tallaId;
  final bool existencia;
  final bool estante;
  bool isSelected;

  @override
  State<CustomSizeSelect> createState() => _CustomSizeSelectState();
}

class _CustomSizeSelectState extends State<CustomSizeSelect> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: GestureDetector(
          onTap: widget.existencia
              ? () {
                  // print("El valor Id de la talla es: ");
                  // print(widget.productId);
                  //print("---------------");
                  //print(widget.existencia);

                  var posiciond = widget.posicion[0].toJson();
                  int tiempoAct = 0;
                  int posy = posiciond['py'];
                  int posx = posiciond['px'];
                  //print('posicion select');
                  //print(posy);
                  print('posicion x');
                  print(posx);

                  if (posy == 1) {
                    tiempoAct = 0;
                    Provider.of<DataProvider>(context, listen: false).updateData(tiempoAct);
                  } else {
                    //tiempoAct = (11 - posy) * 3270;
                    tiempoAct = (11 - posy) * 1000;
                    Provider.of<DataProvider>(context, listen: false).updateData(tiempoAct);
                  }

                  Provider.of<DataProvider>(context, listen: false).updatePos(posy);
                  Provider.of<DataProvider>(context, listen: false).positionx(posx);
                  
                  Provider.of<DataProvider>(context, listen: false).sendPId(widget.productId);
                  Provider.of<DataProvider>(context, listen: false).sendTId(widget.tallaId);

                  setState(() {
                    widget.isSelected = !widget.isSelected; // Alternar el estado al hacer clic
                  });
                  //print(widget.isSelected);
                }
              : null,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            padding: const EdgeInsets.symmetric(horizontal: 31.0, vertical: 3.0),
            decoration: BoxDecoration(
              color: widget.existencia
                  ? widget.estante
                      ? widget.isSelected
                          ? Colors.black
                          : Colors.white
                      : Colors.grey
                  : Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: widget.existencia
                      ? widget.estante
                          ? Colors.black
                          : Colors.grey
                      : Colors.grey),
            ),
            child: Text(
              widget.talla,
              style: TextStyle(
                color: widget.existencia
                    ? widget.estante
                        ? widget.isSelected
                            ? Colors.white
                            : Colors.black
                        : const Color.fromARGB(255, 54, 36, 36)
                    : const Color.fromARGB(255, 54, 36, 36),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}








        // ChoiceChip(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(60),
        //     side: const BorderSide(
        //         color: Colors.black,
        //         width: 1,
        //         style: BorderStyle.solid),
        //   ),
        //   disabledColor: Colors.white,
        //   label: Text(
        //     sizes.talla,
        //     style: appstyle(
        //         15,
        //         sizes.isSelected
        //             ? Colors.green
        //             : Colors.red,
        //         FontWeight.w500),
        //   ),
        //   selectedColor: Colors.black,
        //   padding:
        //       const EdgeInsets.symmetric(vertical: 8),
        //   selected: sizes.isSelected,
        //   onSelected: (newState) {

        //       productNotifier.shoeeSizes[index].isSelected = ! productNotifier.shoeeSizes[index].isSelected;
        //     //   if (productNotifier.sizes
        //     //       .contains(sizes['size'])) {
        //     //     productNotifier.sizes
        //     //         .remove(sizes['size']);
        //     //   } else {
        //     //     productNotifier.sizes
        //     //         .add(sizes['size']);
        //     //   }

        //     for (int i = 0;
        //         i < productNotifier.shoeeSizes.length;
        //         i++) {
        //       if (i == index) {
        //         sizes.isSelected = !sizes.isSelected;
        //       }
        //     }

        //     productNotifier.toggleCheck(index);
        //   },
        // ),