part of 'sms_form_bloc.dart';

abstract class SmsFormState extends Equatable {
  final String phoneNumber;
  const SmsFormState(this.phoneNumber);
}

class SmsFormEmpty extends SmsFormState {
  SmsFormEmpty({String phoneNumber}) : super(phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class SmsFormUnValidated extends SmsFormState {
  SmsFormUnValidated({String phoneNumber}) : super(phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class SmsFormValidated extends SmsFormState {
  SmsFormValidated({phoneNumber}) : super(phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class SmsSending extends SmsFormState {
  SmsSending({phoneNumber}) : super(phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class SmsSendSuccess extends SmsFormState {
  SmsSendSuccess({phoneNumber}) : super(phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class SmsSendFail extends SmsFormState {
  SmsSendFail({phoneNumber}) : super(phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}
