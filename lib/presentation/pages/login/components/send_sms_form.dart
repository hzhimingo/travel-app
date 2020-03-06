import 'package:flutter/material.dart';
import 'phone_number_text_field.dart';
import 'common_login_button.dart';

class SendSmsForm extends StatelessWidget {
  const SendSmsForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
