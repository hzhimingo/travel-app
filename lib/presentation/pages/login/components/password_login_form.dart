import 'package:flutter/material.dart';

import 'normal_text_field.dart';
import 'password_text_field.dart';
import 'common_login_button.dart';

class PasswordLoginForm extends StatelessWidget {
  const PasswordLoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}