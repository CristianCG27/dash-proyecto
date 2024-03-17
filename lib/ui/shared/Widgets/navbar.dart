import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/Widgets/search_text.dart';
import 'package:flutter/material.dart';

import 'navbar_avatar.dart';
import 'notifications_idicator.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700)
            IconButton(
              icon: const Icon(Icons.menu_outlined),
              onPressed: () => SideMenuProvider.openMenu(),
            ),

          const SizedBox(width: 5),

          //Search texbox
          if (size.width > 440)
            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxWidth: 250),
            //   child: const SearchText(),
            // ),

            const Spacer(),

          const NotificationsIndicator(),

          const SizedBox(width: 15), //Espacio entre el icono y el texto

          const NavbarAvatar(),

          const SizedBox(width: 15),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ],
      );
}
