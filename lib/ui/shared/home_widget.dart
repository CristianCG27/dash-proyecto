import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/models/producto.dart';
import 'package:admin_dashboard/ui/shared/style/appstyle.dart';
import 'package:admin_dashboard/providers/product_provider.dart';
import 'package:admin_dashboard/ui/shared/new_shoes.dart';
import 'package:admin_dashboard/ui/views/product_view.dart';
import 'package:admin_dashboard/ui/cards/product_card.dart';
import 'package:admin_dashboard/ui/views/product_by_cat.dart';

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
          height: MediaQuery.of(context).size.height * 0.505,
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
              }
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   print('ok prod  1');
              //   print(snapshot);
              //   return const CircularProgressIndicator();
              // } else if (snapshot.connectionState == ConnectionState.done) {
              //   print('ok prod  DONE');

              //   final male = snapshot.data;
              //   return Text(
              //     male.toString(),
              //   );
              // } else if (snapshot.hasError) {
              //   print('ok prod  2');
              //   return Text("Error ${snapshot.error}");
              // }

              else {
                print(snapshot);
                final male = snapshot.data;
                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        NavigationService.replaceTo(
                            '/dashboard/productos/${shoe.id}' + '/' + '${shoe.category}');
                        // productNofier.shoesSizes = shoe.sizes;
                        // print(productNofier.shoeSizes);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             ProductView(id: shoe.id, category: shoe.category)));
                      },
                      child: ProductCard(
                          price: "\$${shoe.price}",
                          category: shoe.category,
                          id: shoe.id,
                          name: shoe.name,
                          image: shoe.imageUrl[0]),
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
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Últimos modelos",
                    style: appstyle(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      print(tabIndex);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductByCat(
                            tabIndex: tabIndex,
                          ),
                        ),
                      );
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
                      child: NewShoes(imageUrl: shoe.imageUrl[1]),
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
