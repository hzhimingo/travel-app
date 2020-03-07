import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/login/login_bloc.dart';

import 'phone_number_text_field.dart';
import 'common_login_button.dart';

class PhoneNumberChecker extends StatelessWidget {
  const PhoneNumberChecker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    return Container(
      padding: EdgeInsets.only(
        top: 120.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '未注册手机验证后完成注册',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 15.0),
          PhoneNumberTextField(),
          SizedBox(height: 20.0),
          CommonLoginButton(),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              _loginBloc.add(ChangeToPasswordLogin());
            },
            child: Text(
              '账号密码登录',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
