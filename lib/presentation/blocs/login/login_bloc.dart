import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/service/authorization_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthorizationService authorizationService;
  LoginBloc({this.authorizationService});

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
      print(event.phoneNumber);
      yield LoggingIn();
      var result = await authorizationService.getAuthorizedBySMSCode(event.phoneNumber, event.checkCode);
      yield result.fold(
        (failure) => LoginFailure(),
        (authorzation) => LoginSuccess(),
      );
    }
    if (event is LoginByPassword) {
      yield LoggingIn();
      var result = await authorizationService.getAuthorizedByPwd(
        event.account,
        event.password,
      );
      yield result.fold(
        (failure) => LoginFailure(),
        (authorzation) => LoginSuccess(),
      );
    }
  }
}
