part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class SendSmsCode extends LoginState {
  @override
  List<Object> get props => [];
}

class SmsCodeLogin extends LoginState {
  final String phoneNumber;

  SmsCodeLogin({this.phoneNumber});
  @override
  List<Object> get props => [phoneNumber];
}

class PasswordLogin extends LoginState {
  @override
  List<Object> get props => [];
}
