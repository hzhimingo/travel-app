import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:travel/presentation/pages/pages.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Root();
});

var loginHandler = Handler(
  type: HandlerType.function,
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return Login();
        },
      ),
    );
  },
);
