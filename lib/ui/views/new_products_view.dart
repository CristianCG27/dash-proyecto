import 'package:admin_dashboard/providers/products_provider_old.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/style/appstyle.dart';
import 'package:admin_dashboard/models/producto.dart';
import 'package:admin_dashboard/ui/shared/home_widget.dart';

class NewProductsView extends StatefulWidget {
  const NewProductsView({super.key});

  @override
  State<NewProductsView> createState() => _NewProductsViewState();
}

class _NewProductsViewState extends State<NewProductsView> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(vsync: this, length: 3);

  late Future<List<Producto>> _male;
  late Future<List<Producto>> _women;
  late Future<List<Producto>> _kids;

  void getMale() {
    //_male = Helper().getMaleSneakers();
    _male = ProductsProvider().getMaleProducts();
  }

  void getFemale() {
    //_women = Helper().getFemaleSneakers();
    _women = ProductsProvider().getfeMaleProducts();
  }

  void getKids() {
    //_kids = Helper().getKidsSneakers();
    _kids = ProductsProvider().getKidsProducts();
  }

  @override
  void initState() {
    super.initState();

    getMale();
    getFemale();
    getKids();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 0, 0),
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/top_image.png"), fit: BoxFit.fill),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 8, bottom: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sneakers Collection",
                      style: appstyleWithHt(42, Colors.white, FontWeight.bold, 1.2),
                    ),
                    // Text(
                    //   "Collection",
                    //   style: appstyleWithHt(42, Colors.white, FontWeight.bold, 1.2),
                    // ),
                    TabBar(
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.3),
                      tabs: const [
                        Tab(
                          text: "Hombres",
                        ),
                        Tab(
                          text: "Mujeres",
                        ),
                        Tab(
                          text: "Niños",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.18),
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                child: TabBarView(controller: _tabController, children: [
                  HomeWidget(male: _male, tabIndex: 0),
                  HomeWidget(male: _women, tabIndex: 1),
                  HomeWidget(male: _kids, tabIndex: 2),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
