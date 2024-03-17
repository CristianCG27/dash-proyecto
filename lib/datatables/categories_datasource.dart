//import 'package:admin_dashboard/models/http/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesDTS extends DataTableSource {
  //Se modifico <Categoria por <dynamic
  final List<dynamic> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);
  @override
  DataRow getRow(int index) {
    final categoria = categorias[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(categoria.id)),
        DataCell(Text(categoria.nombre)),
        DataCell(Text(categoria.usuario.nombre)),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {
                print('Editando ... ${categoria.nombre}');
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoryModal(categoria: categoria));
              },
              icon: const Icon(Icons.edit_outlined),
            ),
            IconButton(
              onPressed: () {
                final dialogo = AlertDialog(
                  title: const Text('¿Estas seguro de borrarlo?'),
                  content: Text('¿Borrar definitivamente ${categoria.nombre}?'),
                  actions: [
                    TextButton(
                      child: const Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Si, borrar'),
                      onPressed: () async {
                        await Provider.of<CategoriesProvider>(context, listen: false)
                            .deleteCategory(categoria.id);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
                showDialog(context: context, builder: (context) => dialogo);
              },
              icon: Icon(Icons.delete_outline, color: Colors.red.withOpacity(0.8)),
            ),
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}
