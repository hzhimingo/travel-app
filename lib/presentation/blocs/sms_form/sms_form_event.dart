part of 'sms_form_bloc.dart';

abstract class SmsFormEvent extends Equatable {
  const SmsFormEvent();
}

class MakeFormValidated extends SmsFormEvent {
  final String phoneNumber;

  MakeFormValidated({this.phoneNumber});
  @override
  List<Object> get props => [phoneNumber];
}

class MakeFormUnValidated extends SmsFormEvent {
  @override
  List<Object> get props => [];
}

class RequestSendSmsCode extends SmsFormEvent {
  final String phoneNumber;

  RequestSendSmsCode({this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

