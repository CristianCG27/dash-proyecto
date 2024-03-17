/*import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard( String nombre, String id, int precio, {super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // String Nombre = nombre;
  // String id = id;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 170,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F9FD),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF475269).withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              //Container Azul
              Container(
                margin: EdgeInsets.only(top: 5, right: 40),
                height: 110,
                width: 120,
                decoration: BoxDecoration(
                  color: Color(0xFF475269),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Image.asset(
                "images/FormalesOxford_Vestir.png",
                height: 140,
                width: 140,
                fit: BoxFit.contain,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Aqui va el texto del producto
                ///

                const Text('Hola',
                  //nombre,
                  style: TextStyle(
                    color: Color(0xFF475269),
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Zapato para caballero de charol",
                  style: TextStyle(
                    color: Color(0xFF475269).withOpacity(0.8),
                    fontSize: 16,
                    //fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      "\$ 1,200",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 40),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF475269),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.shop_2_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      // child: Icon(
                      //   CupertinoIcons.cart_fill_badge_plus,
                      //   color: Colors.white,
                      //   size: 25,
                      // ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              
            ],

          ),)
        ],
      ),
    );
  }
}
*/