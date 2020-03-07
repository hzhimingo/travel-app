part of 'pwd_form_bloc.dart';

abstract class PwdFormEvent extends Equatable {
  const PwdFormEvent();
}

class AccountChanged extends PwdFormEvent {
  final String account;

  AccountChanged({this.account});

  @override
  List<Object> get props => [account];
}

class PasswordChanged extends PwdFormEvent {
  final String password;

  PasswordChanged({this.password});
  
  @override
  List<Object> get props => [password];
}