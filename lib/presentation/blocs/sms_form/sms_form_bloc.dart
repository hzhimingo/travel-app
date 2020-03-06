import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sms_form_event.dart';
part 'sms_form_state.dart';

class SmsFormBloc extends Bloc<SmsFormEvent, SmsFormState> {
  @override
  SmsFormState get initialState => SmsFormUnValidated();

  @override
  Stream<SmsFormState> mapEventToState(
    SmsFormEvent event,
  ) async* {
    if (event is MakeFormValidated) {
      yield SmsFormValidated(phoneNumber: event.phoneNumber);
    }
    if (event is MakeFormUnValidated) {
      yield SmsFormUnValidated();
    }
    if (event is RequestSendSmsCode) {
      yield SmsSendSuccess(phoneNumber: event.phoneNumber);
    }
  }
}
