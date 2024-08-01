import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/models/producto.dart';
import 'package:admin_dashboard/ui/shared/style/appstyle.dart';
import 'package:admin_dashboard/providers/product_notifier.dart';
import 'package:admin_dashboard/ui/shared/new_shoes.dart';
import 'package:admin_dashboard/ui/cards/product_card.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Producto>> male,
    required this.tabIndex,
  }) : _male = male;

  final Future<List<Producto>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productNofier = Provider.of<ProductNotifier>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.450,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<List<Producto>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                print(snapshot);
                final male = snapshot.data;
                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        productNofier.shoesSizes = shoe.tallas;
                        print(productNofier.shoeSizes);
                        NavigationService.replaceTo(
                            '/dashboard/productos/${shoe.productoPara}/${shoe.id}');

                        // productNofier.shoesSizes = shoe.sizes;

                        // print(productNofier.shoeSizes);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             ProductView(id: shoe.id, category: shoe.category)));
                      },
                      child: ProductCard(
                          price: "\$${shoe.precio}",
                          category: shoe.categoria,
                          id: shoe.id,
                          name: shoe.nombre,
                          image: shoe.img[0],
                          para: shoe.productoPara),
                    );

                    //     Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     color: Colors.green,
                    //     height: MediaQuery.of(context).size.height,
                    //     width: MediaQuery.of(context).size.width * 0.6,
                    //   ),
                    // );
                  },
                );
              }
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Últimos modelos",
                    style: appstyle(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      var para = '';
                      if (tabIndex == 0) {
                        para = 'hombre';
                      } else if (tabIndex == 1) {
                        para = 'mujer';
                      } else if (tabIndex == 2) {
                        para = 'nino';
                      } else {
                        print('Error en el index');
                      }
                      NavigationService.replaceTo('/dashboard/productos/$para');

                      // print(tabIndex);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ProductByCat(
                      //       tabIndex: tabIndex,
                      //     ),
                      //   ),
                      // );
                    },
                    child: Row(
                      children: [
                        Text(
                          "Ver todos los modelos ",
                          style: appstyle(22, Colors.black, FontWeight.w500),
                        ),
                        const Icon(Icons.arrow_right)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: FutureBuilder<List<Producto>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewShoes(imageUrl: shoe.img[0]),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
