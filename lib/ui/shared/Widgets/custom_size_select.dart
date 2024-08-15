import 'package:admin_dashboard/models/posicion.dart';
import 'package:admin_dashboard/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomSizeSelect extends StatefulWidget {
  CustomSizeSelect(
      {super.key, required this.talla, required this.posicion, required this.isSelected});
  final String talla;
  final List<Posicion> posicion;
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
          onTap: () {
            var posiciond = widget.posicion[0].toJson();
            //var selected = widget.isSelected;
            int tiempoAct = 0;
            int posy = posiciond['py'];
            //print(posiciond['px']);
            print(posy);
            if (posy == 1) {
              tiempoAct = 0;
              Provider.of<DataProvider>(context, listen: false).updateData(tiempoAct);
            } else {
              tiempoAct = (11 - posy) * 3270;
              Provider.of<DataProvider>(context, listen: false).updateData(tiempoAct);
            }
              Provider.of<DataProvider>(context, listen: false).updatePos(posy);

            setState(() {
              widget.isSelected = !widget.isSelected; // Alternar el estado al hacer clic
            });
            print(widget.isSelected);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
            decoration: BoxDecoration(
              color: widget.isSelected ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              widget.talla,
              style: TextStyle(
                color: widget.isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )

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
        );
  }
}
