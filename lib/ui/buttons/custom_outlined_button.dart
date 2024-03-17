import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  //const CustomOutlinedButton({super.key});

  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final bool isTextWhite;

  const CustomOutlinedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.color = const Color.fromARGB(255, 27, 67, 136),
      this.isFilled = false,
      this.isTextWhite = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            color: color,
            width: 2,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          isFilled ? color.withOpacity(0.1) : Colors.transparent,
        ),
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isTextWhite ? Colors.white : color,
          ),
        ),
      ),
    );
  }
}
