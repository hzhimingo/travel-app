part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class ChangeToSendSmsCode extends LoginEvent {
  @override
  List<Object> get props => [];
}

class ChangeToPasswordLogin extends LoginEvent {
  @override
  List<Object> get props => [];
}

class JumpToSmsCodeLogin extends LoginEvent {
  final String phoneNumber;

  JumpToSmsCodeLogin({this.phoneNumber});
  
  @override
  List<Object> get props => [phoneNumber];
}
