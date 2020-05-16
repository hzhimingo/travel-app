import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/presentation/blocs/pwd_form/pwd_form_bloc.dart';
import 'package:travel/presentation/blocs/sms_form/sms_form_bloc.dart';
import 'package:travel/route/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/login/login_bloc.dart';

import './components/components.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/images/login_background.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          brightness: Brightness.dark,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              GlobalRoute.router.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '登录后更精彩',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '全世界的旅行故事都在期待与你的相遇',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      showToast("登录成功");
                      context.bloc<AuthorizationBloc>().add(GrantAuthorized());
                      context.bloc<CurrentUserBloc>().add(RefreshCurrentUser());
                      Future.delayed(Duration(milliseconds: 500)).then((value) {
                        GlobalRoute.router.pop(context);
                      });
                    }
                    if (state is LoginFailure) {
                      showToast("登录失败");
                      print('登录失败......发生了错误');
                    }
                    if (state is LoggingIn) {
                      print('登录中......');
                    }
                  },
                  buildWhen: (previous, current) => current is UnLoggedIn,
                  //ignore: missing_return
                  builder: (context, state) {
                    if (state is UnLoggedIn) {
                      if (state.loginType == LoginType.SmsCode) {
                        return BlocProvider<SmsFormBloc>(
                          create: (context) => getIt.get<SmsFormBloc>(),
                          child: SmsLoginForm(),
                        );
                      } else {
                        return BlocProvider<PwdFormBloc>(
                          create: (context) => PwdFormBloc(),
                          child: PasswordLoginForm(),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
