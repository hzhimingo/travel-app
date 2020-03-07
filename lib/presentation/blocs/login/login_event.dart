part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class ChangeToSmsLogin extends LoginEvent {
  @override
  List<Object> get props => [];
}

class ChangeToPasswordLogin extends LoginEvent {
  @override
  List<Object> get props => [];
}

class LoginBySmsCode extends LoginEvent {
  final String phoneNumber;
  final String checkCode;

  LoginBySmsCode({
    @required this.phoneNumber,
    @required this.checkCode,
  });
  @override
  List<Object> get props => [phoneNumber, checkCode];
}

class LoginByPassword extends LoginEvent {
  final String account;
  final String password;

  LoginByPassword({
    @required this.account,
    @required this.password,
  });
  @override
  List<Object> get props => [account, password];
}
