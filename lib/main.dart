//import 'package:admin_dashboard/providers/products_provider_old.dart';
import 'package:admin_dashboard/providers/favorites_provider.dart';
import 'package:admin_dashboard/providers/product_provider.dart';
import 'package:admin_dashboard/ui/shared/Widgets/custom_scroll.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/api/CafeApi.dart';

import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';

import 'package:admin_dashboard/providers/providers.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notification_service.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();

  Flurorouter.configureRoutes();
  WidgetsFlutterBinding.ensureInitialized();
  //var path = Directory.current.path;
  await Hive.initFlutter();
  //Hive.initFlutter(path);
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (context) => ProductNotifier()),
        //ChangeNotifierProvider(create: (_) =>ProductsProvider()),
        ChangeNotifierProvider(create: (_) => UsersProvider()),
        ChangeNotifierProvider(create: (_) => UserFormProvider()),
        ChangeNotifierProvider(create: (context) => FavoritesNotifier()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Admin dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      builder: (_, child) {
        // print('Token: ');
        // print(LocalStorage.prefs.getString('token'));

        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking) {
          return SplashLayout(child: child!);
        }

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }

        //return AuthLayout(child: child!);
        //return DashboardLayout(child: child!);

        //
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 27, 67, 136).withOpacity(0.3)),
        ),
      ),
    );
  }
}
