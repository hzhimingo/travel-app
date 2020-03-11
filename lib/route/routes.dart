import 'package:fluro/fluro.dart';
import 'handler.dart';

class GlobalRoute {
  static Router router;
}

class Routes {
  static String root = '/';
  static String login = '/login';
  static String pop = '/pop';
  static String settings = '/settings';
  static String momentDetail = '/momentDetail';

  static void configureRoutes(Router router) {
    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(pop, handler: popHandler);
    router.define(settings, handler: settingsHandler);
    router.define(momentDetail, handler: momentDetailHandler);
  }
}