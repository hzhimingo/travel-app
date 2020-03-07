import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/login/login_bloc.dart';
import 'package:travel/presentation/blocs/pwd_form/pwd_form_bloc.dart';
import 'package:travel/presentation/blocs/sms_form/sms_form_bloc.dart';

class CommonLoginButton extends StatelessWidget {
  final double height = 55.0;
  final Alignment alignment = Alignment.center;
  final BorderRadius borderRadius = BorderRadius.circular(55.0);
  final TextStyle textStyle = TextStyle(
    letterSpacing: 2.0,
    color: Colors.white,
    fontSize: 19.0,
  );
  final Color defaultColor = Color.fromRGBO(255, 255, 255, 0.6);
  final Color activeColor = Color.fromRGBO(70, 130, 255, 1.0);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current is UnLoggedIn,
      builder: (context, state) {
        if (state is UnLoggedIn) {
          if (state.loginType == LoginType.SmsCode) {
            return BlocConsumer<SmsFormBloc, SmsFormState>(
              listener: (context, state) {
                if (state is SmsSending) {
                  print('发送中');
                }
                if (state is SmsSendSuccess) {
                  print('发送成功');
                }
                if (state is SmsSendFailure) {
                  print('发送失败');
                }
              },
              buildWhen: (previous, current) => current is SmsUnSend,
              builder: (context, state) {
                if (state is SmsUnSend) {
                  if (state.isPhoneValided) {
                    return GestureDetector(
                      onTap: () {
                        context.bloc<SmsFormBloc>().add(
                            RequestSendSmsCode(phoneNumber: state.phoneNumber));
                      },
                      child: _buildButton('获取验证码', activeColor),
                    );
                  } else {
                    return _buildButton('获取验证码', defaultColor);
                  }
                }
              },
            );
          } else {
            return BlocBuilder<PwdFormBloc, PwdFormState>(
              builder: (context, state) {
                if (state.isFormValided) {
                  return GestureDetector(
                    onTap: () {
                      context.bloc<LoginBloc>().add(
                            LoginByPassword(
                              account: state.account,
                              password: state.password,
                            ),
                          );
                    },
                    child: _buildButton('登录', activeColor),
                  );
                } else {
                  return _buildButton('登录', defaultColor);
                }
              },
            );
          }
        }
      },
    );
  }

  _buildButton(String innerText, Color color) {
    return Container(
      width: double.infinity,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Text(
        innerText,
        style: textStyle,
      ),
    );
  }
}
