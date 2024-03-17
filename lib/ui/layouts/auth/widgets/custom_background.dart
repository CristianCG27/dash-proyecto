import 'package:flutter/material.dart';

class BackgroundZ extends StatelessWidget {
  const BackgroundZ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Image(
              image: AssetImage('logo.png'),
              width: 200,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('image.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
