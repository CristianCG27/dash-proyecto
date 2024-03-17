import 'package:flutter/material.dart';

class SplashLayout extends StatelessWidget {
  //const splashLayout({Key? key}) : super(key: key);

  final Widget child;

  const SplashLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Checking...");
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              "Checking... Please wait",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
