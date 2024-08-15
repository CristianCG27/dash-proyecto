import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkCard extends StatelessWidget {
  //const WhiteCard({super.key});

  final String? title;
  final Widget child;
  final double? width;

  const DarkCard({super.key, this.title, required this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? width : null,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: unnecessary_null_comparison
          if (title != null) ...[
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                title!,
                style: GoogleFonts.roboto(
                    fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
            const Divider(),
          ],
          child,
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 28, 34, 41),
          Color.fromARGB(255, 42, 53, 121),
        ],
      ),
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 5,
        ),
      ],
    );
  }
}
