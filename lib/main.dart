import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/route/routes.dart';
import 'package:travel/core/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthorizationBloc>(
            create: (context) => getIt.get<AuthorizationBloc>()..add(ResumeAuthorized()),
          ),
          BlocProvider<CurrentUserBloc>(
            create: (context) => getIt.get<CurrentUserBloc>()..add(RefreshCurrentUser()),
          ),
        ],
        child: MaterialApp(
          // 去掉右上角调试标识
          debugShowCheckedModeBanner: false,
          theme: Themes.normalLight,
          initialRoute: '/',
          onGenerateRoute: GlobalRoute.router.generator,
        ),
      ),
    );
  }
}
