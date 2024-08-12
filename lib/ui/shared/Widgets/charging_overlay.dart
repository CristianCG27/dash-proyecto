import 'dart:async';

import 'package:flutter/material.dart';

class ChargingOverlay extends StatefulWidget {
  const ChargingOverlay({super.key, required this.tiempo});
  final double tiempo;

  @override
  State<ChargingOverlay> createState() => _ChargingOverlayState();
}

class _ChargingOverlayState extends State<ChargingOverlay> {
  int _remainingTime = 5; // Tiempo en segundos para la cuenta regresiva
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _remainingTime = widget.tiempo.toInt();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          Navigator.of(context).pop(); // Cierra el diálogo cuando la cuenta regresiva termina
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Text(
                'Espere mientras el mecanismo se acomoda... $_remainingTime',
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
