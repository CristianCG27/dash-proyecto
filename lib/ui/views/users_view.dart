import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';

import 'package:admin_dashboard/datatables/users_datasource.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDataSource = UsersDTS(usersProvider.users);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Users',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          PaginatedDataTable(
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumIndex,
            columns: [
              const DataColumn(label: Text('Avatar')),
              DataColumn(
                  label: const Text('Nombre'),
                  onSort: ((columnIndex, _) {
                    usersProvider.sortColumIndex = columnIndex;
                    usersProvider.sort<String>((user) => user.nombre);
                  })),
              DataColumn(
                  label: const Text('Email'),
                  onSort: ((columnIndex, _) {
                    usersProvider.sortColumIndex = columnIndex;
                    usersProvider.sort<String>((user) => user.correo);
                  })),
              const DataColumn(label: Text('UID')),
              const DataColumn(label: Text('Acciones')),
            ],
            source: usersDataSource,
            onPageChanged: (page) {
              print('page: $page');
            },
          )
        ],
      ),
    );
  }
}
