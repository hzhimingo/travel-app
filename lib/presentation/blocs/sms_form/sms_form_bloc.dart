import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/core/util/validators.dart';
import 'package:travel/service/login_service.dart';

part 'sms_form_event.dart';
part 'sms_form_state.dart';

class SmsFormBloc extends Bloc<SmsFormEvent, SmsFormState> {

  final LoginService loginService;

  SmsFormBloc({this.loginService});

  @override
  SmsFormState get initialState => SmsUnSend(isPhoneValided: false, phoneNumber: null);

  @override
  Stream<SmsFormState> mapEventToState(
    SmsFormEvent event,
  ) async* {
    if (event is VerifyPhoneNumber) {
      if (Validators.isPhoneNumber(event.phoneNumber)) {
        yield SmsUnSend(isPhoneValided: true, phoneNumber: event.phoneNumber);
      } else {
        yield SmsUnSend(isPhoneValided: false, phoneNumber: event.phoneNumber);
      }
    }
    if (event is SetPhoneNumberUnValided) {
      yield SmsUnSend(isPhoneValided: false, phoneNumber: null);
    }
    if (event is RequestSendSmsCode) {
      yield SmsSending();
      var result = await loginService.sendLoginSMSCode(event.phoneNumber);
      yield result.fold(
        (failure) => SmsSendFailure(),
        (success) => SmsSendSuccess(phoneNumber: event.phoneNumber)
      );
    }
  }
}
