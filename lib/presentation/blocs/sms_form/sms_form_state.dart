part of 'sms_form_bloc.dart';

abstract class SmsFormState extends Equatable {
  const SmsFormState();
}

class SmsUnSend extends SmsFormState {
  final bool isPhoneValided;
  final String phoneNumber;

  SmsUnSend({
    @required this.isPhoneValided,
    @required this.phoneNumber,
  });
  @override
  List<Object> get props => [isPhoneValided, phoneNumber];
}

class SmsSending extends SmsFormState {
  @override
  List<Object> get props => [];

}

class SmsSendFailure extends SmsFormState {
  @override
  List<Object> get props => [];
}

class SmsSendSuccess extends SmsFormState {
  final String phoneNumber;

  SmsSendSuccess({@required this.phoneNumber});
  @override
  List<Object> get props => [phoneNumber];
}