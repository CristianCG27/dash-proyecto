import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  //final String title;

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'logo.png',
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 20),
          FittedBox(
            
            fit: BoxFit.contain,
            child: Text('Happening Now',
                style:  GoogleFonts.montserratAlternates(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                ),
          ),
        ],
      ),
    );
  }
}
