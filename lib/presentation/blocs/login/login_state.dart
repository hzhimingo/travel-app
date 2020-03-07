part of 'login_bloc.dart';

enum LoginType {
  SmsCode,
  Password,
}

abstract class LoginState extends Equatable {
  const LoginState();
}

class UnLoggedIn extends LoginState {
  final LoginType loginType;
  UnLoggedIn({this.loginType});
  @override
  List<Object> get props => [loginType];
}

class LoggingIn extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailure extends LoginState {
  @override
  List<Object> get props => [];
}
