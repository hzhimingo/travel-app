import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => SendSmsCode();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is JumpToSmsCodeLogin) {
      yield SmsCodeLogin(phoneNumber: event.phoneNumber);
    }
    if (event is ChangeToPasswordLogin) {
      yield PasswordLogin();
    }
    if (event is ChangeToSendSmsCode) {
      yield SendSmsCode();
    }
  }
}
