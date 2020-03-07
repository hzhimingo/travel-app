import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/login/login_bloc.dart';

import 'normal_text_field.dart';
import 'password_text_field.dart';
import 'common_login_button.dart';

class PasswordLoginForm extends StatelessWidget {
  const PasswordLoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    return Container(
      padding: EdgeInsets.only(
        top: 120.0,
      ),
      child: Column(
        children: <Widget>[
          NormalTextField(),
          SizedBox(height: 15.0),
          PasswordTextField(),
          SizedBox(height: 25.0),
          CommonLoginButton(),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _loginBloc.add(ChangeToSmsLogin());
                },
                child: Text(
                  '验证码登录',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                },
                child: Text(
                  '忘记密码',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
