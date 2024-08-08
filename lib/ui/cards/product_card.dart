import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:community_material_icon/community_material_icon.dart';

import 'package:admin_dashboard/models/constants.dart';

import 'package:admin_dashboard/ui/shared/style/appstyle.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.price,
      required this.category,
      required this.id,
      required this.name,
      required this.image,
      required this.para});

  final String price;
  final String category;
  final String id;
  final String name;
  final String image;
  final String para;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final _favBox = Hive.box('fav_box');

  Future<void> _createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
    getFavorites();
  }

  getFavorites() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {"key": key, "id": item["id"]};
    }).toList();

    favor = favData.toList();
    ids = favor.map((item) => item('id')).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //bool selected = true;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.15,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 1, blurRadius: 0.6, offset: Offset(1, 1)),
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(widget.image)),
                    ),
                  ),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: () async {
                          // if (ids.contains(widget.id)) {
                          //   Navigator.push(context,
                          //       MaterialPageRoute(builder: (context) => const FavoritesPage()));
                          // } else {
                          //   _createFav({
                          //     "id": widget.id,
                          //     "name": widget.name,
                          //     "category": widget.category,
                          //     "price": widget.price,
                          //     "imageUrl": widget.image
                          //   });
                          // }
                        },
                        child: ids.contains(widget.id)
                            ? const Icon(CommunityMaterialIcons.heart)
                            : const Icon(CommunityMaterialIcons.heart_outline),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.name,
                        style: appstyleWithHt(18, Colors.black, FontWeight.bold, 1.1),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.para,
                        style: appstyleWithHt(15, Colors.grey, FontWeight.bold, 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              //const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.price,
                          style: appstyle(30, Colors.black, FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Colors",
                          style: appstyle(18, Colors.grey, FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(500)),
                          child: Container(
                            color: Colors.black,
                            child: const Text(
                              ".....",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(width: 3),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(500)),
                          child: Container(
                            color: Colors.yellow,
                            child: const Text(
                              ".....",
                              style: TextStyle(color: Colors.yellow),
                            ),
                          ),
                        ),
                        const SizedBox(width: 3),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(500)),
                          child: Container(
                            color: Colors.red,
                            child: const Text(
                              ".....",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        )
                        // ChoiceChip(
                        //   label: const Text(""),
                        //   selected: selected,
                        //   visualDensity: VisualDensity.compact,
                        //   selectedColor: Colors.black,
                        // )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
