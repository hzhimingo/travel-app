import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/pwd_form/pwd_form_bloc.dart';
import 'package:travel/presentation/blocs/sms_form/sms_form_bloc.dart';
import 'package:travel/route/routes.dart';
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
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is SmsCodeLogin) {
                      return SmsLoginForm();
                    } else if (state is PasswordLogin) {
                      return BlocProvider<PwdFormBloc>(
                        create: (context) => PwdFormBloc(),
                        child: PasswordLoginForm(),
                      );
                    } else {
                      return BlocProvider<SmsFormBloc>(
                        create: (context) => SmsFormBloc(),
                        child: SendSmsForm(),
                      );
                    }
                  },
                ),
                LoginOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
