import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel/core/route/routes.dart';
import 'package:travel/core/theme/themes.dart';

void main() {
  setStatusBar();
  setRoute();
  runApp(TravelApp());
}

/// 设置状态栏
setStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      // 将状态栏设置为透明
      statusBarColor: Colors.transparent,
      // 状态栏字体图标颜色设置为黑色
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

//初始化路由
setRoute() {
  final router = Router();
  Routes.configureRoutes(router);
  GlobalRoute.router = router;
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        // 去掉右上角调试标识
        debugShowCheckedModeBanner: false,
        theme: Themes.normalLight,
        initialRoute: '/',
        onGenerateRoute: GlobalRoute.router.generator,
      ),
    );
  }
}