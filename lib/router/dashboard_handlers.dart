//import 'package:admin_dashboard/ui/views/products_view_old.dart';
import 'package:admin_dashboard/ui/views/new_products_view.dart';
import 'package:admin_dashboard/ui/views/product_view.dart';

import 'package:admin_dashboard/ui/views/user_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';

import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/categories_view.dart';
import 'package:admin_dashboard/ui/views/users_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';

//DAHSBOARD PRINCIPAL
class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.dashboardRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const DashboardView();
      } else {
        return LoginView();
      }
    },
  );

  //ICONOS

  static Handler icons = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.iconsRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const IconsView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler blank = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.blankRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const BlankView();
      } else {
        return LoginView();
      }
    },
  );

  //CATEGORIAS

  static Handler categories = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.categoriesRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const CategoriesView();
      } else {
        return LoginView();
      }
    },
  );

  //USUARIOS

  static Handler users = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.usersRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return UsersView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler user = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.userRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        print(params);
        if (params['uid']?.first != null) {
          return UserView(uid: params['uid']!.first);
        } else {
          return UsersView();
        }
      } else {
        return LoginView();
      }
    },
  );

  //PRODUCTOS
  static Handler productos = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.productosRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const NewProductsView(); //ProductosView();
      } else {
        return LoginView();
      }
    },
  );
  static Handler producto = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.productoRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        print(params);
        if (params['id']?.first != null) {
          return ProductView(
            id: params['id']!.first,
            category: params['category']!.first,
          );
        } else {
          return UsersView();
        }
        //return const NewProductsView(); //ProductosView();
      } else {
        return LoginView();
      }
    },
  );
}
