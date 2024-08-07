import 'package:admin_dashboard/providers/products_provider_old.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive/hive.dart';

import 'package:provider/provider.dart';

import 'package:admin_dashboard/models/producto.dart';
import 'package:admin_dashboard/providers/product_notifier.dart';
import 'package:admin_dashboard/ui/shared/style/appstyle.dart';
import 'package:admin_dashboard/ui/buttons/checkout_btn.dart';
import 'package:admin_dashboard/providers/favorites_provider.dart';
//import 'package:tienda_online/views/ui/favorites_page.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.id, required this.para});

  final String id;
  final String para;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final PageController pageController = PageController();

  final _cartBox = Hive.box('cart_box');
  //final _favBox = Hive.box('fav_box');

  late Future<Producto?> _producto;
  //bool? isSelected = false;

  void getShoes() {
    if (widget.para == 'hombre') {
      //_producto = Helper().getMaleSneakersById(widget.id);

      //print('${widget.id} and ${widget.para}  hombre');
      _producto = ProductsProvider().getMaleProductById(widget.id);
    } else if (widget.para == 'mujer') {
      //print('${widget.id} and ${widget.para} mujer');
      //_producto = Helper().getFemaleSneakersById(widget.id);
      _producto = ProductsProvider().getfeMaleProductById(widget.id);
    } else {
      //print('${widget.id} and ${widget.para}  nino');

      _producto = ProductsProvider().getKidsProductById(widget.id);
    }
  }

  Future<void> _createCart(Map<String, dynamic> newCart) async {
    await _cartBox.add(newCart);
  }

  // Future<void> _createFav(Map<String, dynamic> addFav) async {
  //   await _favBox.add(addFav);
  // }

  @override
  void initState() {
    super.initState();
    getShoes();
  }

  @override
  Widget build(BuildContext context) {
    var favoritesNotifier = Provider.of<FavoritesNotifier>(context, listen: true);
    //var productNotifier = Provider.of<ProductNotifier>(context);
    favoritesNotifier.getFavorites();
    return Scaffold(
      body: FutureBuilder<Producto?>(
        future: _producto,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          } else {
            final producto = snapshot.data;
            return Consumer<ProductNotifier>(
              builder: (context, productNotifier, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomScrollView(
                    scrollDirection: Axis.vertical,
                    slivers: <Widget>[
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        leadingWidth: 0,
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  NavigationService.replaceTo('/dashboard/productos');
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: null,
                                child: const Icon(
                                  FontAwesomeIcons.ellipsis,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        pinned: true,
                        snap: false,
                        floating: true,
                        backgroundColor: Colors.transparent,
                        expandedHeight: MediaQuery.of(context).size.height,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.50,
                                width: MediaQuery.of(context).size.width,
                                child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: producto!.img.length,
                                  controller: pageController,
                                  onPageChanged: (page) {
                                    productNotifier.activePage = page;
                                  },
                                  itemBuilder: (context, int index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.39,
                                          width: MediaQuery.of(context).size.width,
                                          color: Colors.grey.shade300,
                                          child: Center(
                                            child: CachedNetworkImage(
                                              imageUrl: producto.img[index],
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: MediaQuery.of(context).size.height * 0.3,
                                          right: 15,
                                          child: Consumer<FavoritesNotifier>(
                                              builder: (context, favoritesNotifier, child) {
                                            return GestureDetector(
                                              onTap: () {
                                                // print('fav');
                                              },
                                              child: favoritesNotifier.ids.contains(producto.id)
                                                  ? const Icon(
                                                      CommunityMaterialIcons.heart,
                                                      color: Colors.black,
                                                      size: 30,
                                                    )
                                                  : const Icon(
                                                      CommunityMaterialIcons.heart_outline,
                                                      color: Colors.black,
                                                      size: 30,
                                                    ),
                                            );
                                          }),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          left: 0,
                                          height: MediaQuery.of(context).size.height * 0.3,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: List<Widget>.generate(
                                              producto.img.length,
                                              (index) => Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor:
                                                      productNotifier.activepage != index
                                                          ? Colors.grey
                                                          : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),

                              // SliverList(
                              //   delegate: SliverChildBuilderDelegate(
                              // (BuildContext context, int index) {
                              //   return

                              Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.365),
                                //top: MediaQuery.of(context).size.height * 0.365,
                                //width: MediaQuery.of(context).size.height * 1.67,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.645,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            producto.nombre,
                                            style: appstyle(40, Colors.black, FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                producto.categoria,
                                                style: appstyle(20, Colors.grey, FontWeight.w500),
                                              ),
                                              const SizedBox(width: 20),
                                              RatingBar.builder(
                                                  initialRating: 4,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 22,
                                                  itemPadding:
                                                      const EdgeInsets.symmetric(horizontal: 1),
                                                  itemBuilder: (context, _) => const Icon(
                                                        Icons.star,
                                                        size: 18,
                                                        color: Colors.black,
                                                      ),
                                                  onRatingUpdate: (rating) {}),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "\$${producto.precio}",
                                                style: appstyle(26, Colors.black, FontWeight.w600),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Colores",
                                                    style:
                                                        appstyle(18, Colors.black, FontWeight.w500),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: Colors.black,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  const CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                          ///TODO
                                          const SizedBox(height: 10),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Selecciona talla",
                                                    style:
                                                        appstyle(20, Colors.black, FontWeight.w600),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  Text(
                                                    "Guia de tallas",
                                                    style:
                                                        appstyle(20, Colors.grey, FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              SizedBox(
                                                height: 100,
                                                //width: MediaQuery.of(context).size.width * 0.5,
                                                child: ListView.builder(
                                                  itemCount: productNotifier.shoeeSizes.length,

                                                  ///
                                                  scrollDirection: Axis.horizontal,
                                                  padding: EdgeInsets.zero,

                                                  ///
                                                  itemBuilder: (context, index) {
                                                    final sizes = productNotifier.shoeeSizes[index];
                                                    print(productNotifier.shoeeSizes.length);
                                                    print('++++++++++++++++++++++++++');
                                                    return Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                            horizontal: 2.0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              // for (int i = 0;
                                                              //     i <
                                                              //         productNotifier
                                                              //             .shoeeSizes.length;
                                                              //     i++) {
                                                              //   if (i == index) {
                                                              //     i.isSelected ==!i.isSelected;
                                                              //   }
                                                              // }
                                                              for (var i
                                                                  in productNotifier.shoeeSizes) {
                                                                if (i == index) {
                                                                  i.isSelected == !i.isSelected;
                                                                }
                                                                //i.isSelected = false;
                                                              }
                                                              // sizes.isSelected = true;
                                                              productNotifier.toggleCheck();
                                                            });
                                                          },
                                                          child: Container(
                                                            margin: EdgeInsets.symmetric(
                                                                horizontal: 8.0),
                                                            padding: EdgeInsets.symmetric(
                                                                vertical: 10.0, horizontal: 20.0),
                                                            decoration: BoxDecoration(
                                                              color: sizes.isSelected
                                                                  ? Colors.green
                                                                  : Colors.white,
                                                              borderRadius:
                                                                  BorderRadius.circular(5.0),
                                                              border:
                                                                  Border.all(color: Colors.blue),
                                                            ),
                                                            child: Text(
                                                              sizes.isSelected.toString(),
                                                              style: TextStyle(
                                                                color: sizes.isSelected
                                                                    ? Colors.white
                                                                    : Colors.blue,
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
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          const Divider(
                                            indent: 10,
                                            endIndent: 10,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(height: 5),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.8,
                                            child: Text(
                                              producto.nombre,
                                              maxLines: 2,
                                              style: appstyle(15, Colors.black, FontWeight.w700),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            //todo
                                            //cambiar a descripcion
                                            producto.descripcion,
                                            textAlign: TextAlign.justify,
                                            maxLines: 4,
                                            style: appstyle(12, Colors.black, FontWeight.normal),
                                          ),
                                          const SizedBox(height: 5),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 70),
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 12),
                                              child: CheckOutBtn(
                                                  onTap: () async {
                                                    _createCart({
                                                      "id": producto.id,
                                                      "name": producto.nombre,
                                                      "category": producto.categoria,
                                                      //"sizes": productNotifier.sizes,
                                                      "imageUrl": producto.img[0],
                                                      "price": producto.precio,
                                                      "qty": 1
                                                    });
                                                    //productNotifier.sizes.clear();
                                                    Navigator.pop(context);
                                                  },
                                                  label: "Ordenar"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //},
                              //   ),
                              // ),
                              //SizedBox(height: MediaQuery.of(context).size.height * 0.5),

                              ///////
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
