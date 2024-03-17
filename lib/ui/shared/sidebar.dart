import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/shared/Widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/Widgets/menu_item.dart';
import 'package:admin_dashboard/ui/shared/Widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  void navigateTo(String routeName) {
    //NavigationService.navigateTo(routeName);
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),
          const TextSeparator(text: 'main'),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            onPressed: () {
              navigateTo(Flurorouter.dashboardRoute);
              print('Dashboard');
            },
          ),
          MenuItem(
            text: 'Ordenes',
            icon: Icons.shopping_cart_outlined,
            //isActive: false,
            onPressed: () {},
          ),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.categoriesRoute,
            text: 'Categorias',
            icon: Icons.layers_outlined,
            //isActive: false,
            onPressed: () {
              navigateTo(Flurorouter.categoriesRoute);
            },
          ),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.productosRoute,
            text: 'Productos',
            icon: Icons.dashboard_outlined,
            //isActive: false,
            onPressed: () {
              navigateTo(Flurorouter.productosRoute);
            },
          ),
          MenuItem(
            text: 'Discount',
            icon: Icons.attach_money_outlined,
            //isActive: false,
            onPressed: () {},
          ),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.usersRoute,
            text: 'Users',
            icon: Icons.people_alt_outlined,
            //isActive: false,
            onPressed: () {
              navigateTo(Flurorouter.usersRoute);
            },
          ),
          const SizedBox(height: 30),
          const TextSeparator(text: 'main'),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            //isActive: false,
            onPressed: () {
              navigateTo(Flurorouter.iconsRoute);
            },
          ),
          MenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            //isActive: false,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Campaign',
            icon: Icons.note_add_outlined,
            //isActive: false,
            onPressed: () {},
          ),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
            text: 'Blank',
            icon: Icons.post_add_outlined,
            onPressed: () {
              navigateTo(Flurorouter.blankRoute);
            },
          ),
          const SizedBox(height: 50),
          const TextSeparator(text: 'Exit'),
          MenuItem(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            //isActive: false,
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xff092044),
          Color(0xff092042),
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
        )
      ],
    );
  }
}
