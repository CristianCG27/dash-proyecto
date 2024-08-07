import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:admin_dashboard/models/producto.dart';
import 'package:admin_dashboard/ui/shared/Widgets/stagger_tile.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    super.key,
    required Future<List<Producto>> male,
  }) : _male = male;

  final Future<List<Producto>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Producto>>(
      future: _male,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        } else {
          //print('****************************');
          //print(_male);
          //print('Este es el male de latest');
          final male = snapshot.data;
          //print(male!.length);

          //TODO:----------------------------------------
          return AlignedGridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            itemCount: male!.length,
            scrollDirection: Axis.vertical,
            // StaggerTileBuilder: (index) => StaggeredTile.extent(
            //     (index % 2 == 0) ? 1 : 1,
            //     (index % 4 == 1 || index % 4 == 3)
            //         ? MediaQuery.of(context).size.height * 0.35
            //         : MediaQuery.of(context).size.height * 0.3),

            itemBuilder: (context, index) {
              //print(snapshot.data![index]);
              final shoe = snapshot.data![index];

              return StaggerTile(
                  imageUrl: shoe.img[0], name: shoe.nombre, price: "\$${shoe.precio}");
            },
          );
          //TODO:-----------------------------------------
        }
      },
    );
  }
}
