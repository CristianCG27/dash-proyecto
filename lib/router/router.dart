import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  //Auth routes

  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //Dashboard routes

  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';
  static String categoriesRoute = '/dashboard/categories';
  static String productosRoute = '/dashboard/productos';
  static String productoParaRoute = '/dashboard/productos/:para';
  static String productoRoute = '/dashboard/productos/:para/:id';
  static String usersRoute = '/dashboard/users';
  static String userRoute = '/dashboard/users/:uid';

  //Auth handlers

  static void configureRoutes() {
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);
    // router.define(dashboardRoute, handler: handler);

    //Dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard, transitionType: TransitionType.fadeIn);
    router.define(iconsRoute,
        handler: DashboardHandlers.icons, transitionType: TransitionType.fadeIn);
    router.define(blankRoute,
        handler: DashboardHandlers.blank, transitionType: TransitionType.fadeIn);
    router.define(categoriesRoute,
        handler: DashboardHandlers.categories, transitionType: TransitionType.fadeIn);

    //productos
    router.define(productosRoute,
        handler: DashboardHandlers.productos, transitionType: TransitionType.fadeIn);
    router.define(productoRoute,
        handler: DashboardHandlers.producto, transitionType: TransitionType.fadeIn);
    router.define(productoParaRoute,
        handler: DashboardHandlers.productoPara, transitionType: TransitionType.fadeIn);

    //USERS
    router.define(usersRoute,
        handler: DashboardHandlers.users, transitionType: TransitionType.fadeIn);
    router.define(userRoute,
        handler: DashboardHandlers.user, transitionType: TransitionType.fadeIn);

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
