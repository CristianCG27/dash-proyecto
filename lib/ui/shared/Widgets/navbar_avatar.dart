import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      // ignore: sized_box_for_whitespace
      child: Container(
        width: 30,
        height: 30,
        child: Image.network(
            'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_640.png'),
      ),
    );
  }
}
