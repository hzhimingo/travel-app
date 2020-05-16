import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:travel/presentation/blocs/login/login_bloc.dart';
import 'package:travel/presentation/blocs/sms_form/sms_form_bloc.dart';

import 'resend_sms_timer.dart';

class SmsCodeLogin extends StatelessWidget {
  const SmsCodeLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //showToast("验证码已发送，注意查收");
    String phoneNumber = "";
    //ignore: close_sinks
    final LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    return Container(
      padding: EdgeInsets.only(top: 70.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '已发送验证码至',
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
                ),
                SizedBox(
                  width: 8.0,
                ),
                BlocBuilder<SmsFormBloc, SmsFormState>(
                  builder: (context, state) {
                    if (state is SmsSendSuccess) {
                      phoneNumber = state.phoneNumber;
                      return Text(
                        state.phoneNumber,
                        style: TextStyle(color: Colors.white, fontSize: 17.0),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          PinCodeTextField(
            pinBoxWidth: 45.0,
            pinBoxHeight: 50.0,
            maxLength: 6,
            highlight: true,
            highlightColor: Colors.blue,
            defaultBorderColor: Color.fromRGBO(255, 255, 255, 0.1),
            hasTextBorderColor: Color.fromRGBO(255, 255, 255, 0.1),
            onTextChanged: (text) {},
            onDone: (text) {
              _loginBloc.add(LoginBySmsCode(phoneNumber: phoneNumber, checkCode: text));
            },
            wrapAlignment: WrapAlignment.spaceAround,
            pinBoxRadius: 5.0,
            pinTextStyle: TextStyle(fontSize: 30.0, color: Colors.white),
            pinTextAnimatedSwitcherTransition:
                ProvidedPinBoxTextAnimation.scalingTransition,
            pinBoxColor: Color.fromRGBO(255, 255, 255, 0.5),
            pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
            highlightAnimationBeginColor: Colors.black,
            highlightAnimationEndColor: Colors.white12,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ResendSmsTimer(),
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
          )
        ],
      ),
    );
  }
}
