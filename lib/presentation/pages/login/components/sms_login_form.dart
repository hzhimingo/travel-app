import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/sms_form/sms_form_bloc.dart';

import 'sms_code_login.dart';
import 'phone_number_checker.dart';

class SmsLoginForm extends StatelessWidget {
  const SmsLoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SmsFormBloc, SmsFormState>(
      listener: (context, state) {},
      buildWhen: (previous, current) {
        if (current is SmsUnSend || current is SmsSendSuccess) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is SmsUnSend) {
          return PhoneNumberChecker();
        }
        if (state is SmsSendSuccess) {
          return SmsCodeLogin();
        }
      },
    );
  }
}
