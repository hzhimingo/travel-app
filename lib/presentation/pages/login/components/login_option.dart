import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/login/login_bloc.dart';

import 'resend_sms_timer.dart';

class LoginOption extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 15.0,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is PasswordLogin) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildClickableText(
                onPressed: () {
                  context.bloc<LoginBloc>().add(ChangeToSendSmsCode());
                },
                text: '验证码登录',
              ),
              _buildClickableText(
                onPressed: () {},
                text: '忘记密码',
              ),
            ],
          );
        } else if (state is SendSmsCode) {
          return _buildClickableText(
            onPressed: () {
              context.bloc<LoginBloc>().add(ChangeToPasswordLogin());
            },
            text: '账号密码登录',
          );
        } else {
          return ResendSmsTimer();
        }
      },
    );
  }

  _buildClickableText({VoidCallback onPressed, String text}) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Text(
        text,
        style: _textStyle,
      ),
    );
  }
}
