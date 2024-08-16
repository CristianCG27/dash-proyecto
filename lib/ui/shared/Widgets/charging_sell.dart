import 'package:flutter/material.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

class ChargingSell extends StatefulWidget {
  const ChargingSell({super.key});

  @override
  _ChargingSellState createState() => _ChargingSellState();
}

class _ChargingSellState extends State<ChargingSell> {

  void navigateTo(String routeName) {
    //NavigationService.navigateTo(routeName);
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }
  @override
  void initState() {
    super.initState();

    // Espera 3 segundos antes de redirigir
    Future.delayed(const Duration(seconds: 3), () {navigateTo(Flurorouter.dashboardRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Producto vendido, redirigiendo...'),
          ],
        ),
      ),
    );
  }
}


