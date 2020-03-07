part of 'sms_form_bloc.dart';

abstract class SmsFormEvent extends Equatable {
  const SmsFormEvent();
}

class VerifyPhoneNumber extends SmsFormEvent {
  final String phoneNumber;

  VerifyPhoneNumber({@required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class SetPhoneNumberUnValided extends SmsFormEvent {
  @override
  List<Object> get props => [];
}

class RequestSendSmsCode extends SmsFormEvent {
  final String phoneNumber;

  RequestSendSmsCode({
    @required this.phoneNumber,
  });
  @override
  List<Object> get props => [phoneNumber];

}
