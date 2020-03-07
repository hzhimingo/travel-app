import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => UnLoggedIn(loginType: LoginType.SmsCode);

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is ChangeToSmsLogin) {
      yield UnLoggedIn(loginType: LoginType.SmsCode);
    }
    if (event is ChangeToPasswordLogin) {
      yield UnLoggedIn(loginType: LoginType.Password);
    }
    if (event is LoginBySmsCode) {
      yield LoggingIn();
    }
    if (event is LoginByPassword) {
      yield LoggingIn();
    }
  }
}
