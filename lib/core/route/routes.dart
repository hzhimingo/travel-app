import 'package:fluro/fluro.dart';
import 'handler.dart';

class GlobalRoute {
  static Router router;
}

class Routes {
  static String root = '/';
  static String login = '/login';

  static void configureRoutes(Router router) {
    router.define(root, handler: rootHandler);
  }
}