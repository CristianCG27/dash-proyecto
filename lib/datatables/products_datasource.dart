/*import 'package:flutter/material.dart';

class ProductsDTS extends DataTableSource {
  final List<dynamic> productos;
  final BuildContext context;

  ProductsDTS(this.productos, this.context);
  @override
  DataRow getRow(int index) {
    final producto = productos[index];

    final image = (producto.img == null)
        ? const Image(
            image: AssetImage('noimage.jpg'),
            width: 50,
            height: 50,
          )
        : FadeInImage.assetNetwork(
            placeholder: 'loader.gif', image: producto.img!, width: 50, height: 50);

    return DataRow.byIndex(index: index, cells: [
      DataCell(image),
      DataCell(Text(producto.id)),
      DataCell(Text(producto.nombre)),
      DataCell(Text(producto.precio.toString())),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => productos.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
*/