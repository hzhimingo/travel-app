import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel/core/util/validators.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:travel/presentation/blocs/login/login_bloc.dart';
import 'package:travel/presentation/blocs/pwd_form/pwd_form_bloc.dart';
import 'package:travel/presentation/blocs/sms_form/sms_form_bloc.dart';
import 'package:travel/route/routes.dart';

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
    return BlocBuilder<LoginBloc, LoginState>(
      //ignore: missing_return
      builder: (context, state) {
        if (state is SendSmsCode) {
          return BlocConsumer<SmsFormBloc, SmsFormState>(
            listener: (context, state) {
              if (state is SmsSendSuccess) {
                showToast('短信验证码发送成功');
                context.bloc<LoginBloc>().add(JumpToSmsCodeLogin(phoneNumber: state.phoneNumber));
              }
              if (state is SmsSendFail) {
                showToast('短信验证码发送失败,请重试');
              }
            },
            //ignore: missing_return
            builder: (context, state) {
              if (state is SmsFormUnValidated) {
                return _buildButton('获取验证码', defaultColor);
              }
              if (state is SmsFormValidated) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (Validators.isPhoneNumber(state.phoneNumber)) {
                      //发送短信验证码
                      context.bloc<SmsFormBloc>().add(
                          RequestSendSmsCode(phoneNumber: state.phoneNumber));
                    } else {
                      showToast('请输入正确的手机号码');
                    }
                  },
                  child: _buildButton('获取验证码', activeColor),
                );
              }
            },
          );
        }
        if (state is PasswordLogin) {
          return BlocConsumer<PwdFormBloc, PwdFormState>(
            listener: (context, state) {
              if (state.isSubmitting) {
                //登录
                showToast('登录中......');
              }
              if (state.isSuccess) {
                showToast('登录成功');
                context.bloc<AuthorizationBloc>().add(SetAuthorized(authorization: state.authorization));
                GlobalRoute.router.pop(context);
              }
              if (state.isFailure) {
                showToast('登录失败，用户名或密码错误');
              }
            },
            builder: (context, state) {
              if (state.isFormValid) {
                return GestureDetector(
                  onTap: () {
                    context.bloc<PwdFormBloc>().add(
                          SubmitForm(
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
