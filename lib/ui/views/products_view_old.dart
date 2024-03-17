/*import 'package:admin_dashboard/datatables/products_datasource.dart';
import 'package:admin_dashboard/datatables/products_datasource_prodCard.dart';
//import 'package:admin_dashboard/providers/products_provider_old.dart';
import 'package:admin_dashboard/ui/cards/product_card_old.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/shared/Widgets/search_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductosView extends StatefulWidget {
  const ProductosView({super.key});

  @override
  State<ProductosView> createState() => _ProductosViewState();
}

class _ProductosViewState extends State<ProductosView> {
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context, listen: false).getProductos();
  }

  @override
  Widget build(BuildContext context) {
    final productos = Provider.of<ProductsProvider>(context).productos;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'PRODUCTOS',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),

          //ProductCard(),

          PaginatedDataTable(
            headingRowHeight: 50,
            dataRowHeight: 200,
            columns: const [
              // DataColumn(label: Text('Imagen')),
              // DataColumn(label: Text('ID')),
              // DataColumn(label: Text('Nombre')),
              // DataColumn(label: Text('Precio')),
              DataColumn(label: Text('Productos'))
            ],
            source: ProductsDTSPCard(productos, context),
            header: const Text('Productos Disponibles', maxLines: 2),
            onRowsPerPageChanged: (value) {
              print(value);
              setState(() {
                _rowPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowPerPage,
          )
        ],
      ),
    );
  }
}


*/
// class ProductosView extends StatelessWidget {
//   const ProductosView({super.key});
//   //min 12
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: ListView(
//         physics: const ClampingScrollPhysics(),
//         children: [
//           Text(
//             'Productos View',
//             style: CustomLabels.h1,
//           ),
//           const SizedBox(height: 10),

//           /// Area de búsqueda
//           if (size.width > 440)
//             const WhiteCard(
//               child: SearchText(),
//             ),

//           const Wrap(
//             crossAxisAlignment: WrapCrossAlignment.start,
//             direction: Axis.horizontal,
//             children: [
//               //
//               WhiteCard(
//                 child: ProductCard(),

//                 // title: 'ac_unit_outlined',
//                 // width: 170,
//                 // child: Center(
//                 //   child: Icon(Icons.ac_unit_outlined),
//                 // ),
//               ),

//               //
//               WhiteCard(
//                 title: 'access_alarm_outlined',
//                 width: 170,
//                 child: Center(
//                   child: Icon(Icons.access_alarm_outlined),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
