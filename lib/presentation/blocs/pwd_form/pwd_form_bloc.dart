import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/core/util/validators.dart';
import 'package:travel/entity/authorization.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/service/authorization_service.dart';

part 'pwd_form_event.dart';
part 'pwd_form_state.dart';

class PwdFormBloc extends Bloc<PwdFormEvent, PwdFormState> {
  @override
  PwdFormState get initialState => PwdFormState.empty();

  @override
  Stream<PwdFormState> mapEventToState(
    PwdFormEvent event,
  ) async* {
    if (event is AccountChanged) {
      yield state.update(
          isEmailValid: Validators.isAccount(event.account),
          account: event.account);
    }
    if (event is PasswordChanged) {
      yield state.update(
          isPasswordValid: Validators.isPassword(event.password),
          password: event.password);
    }
    if (event is SubmitForm) {
      yield PwdFormState.loading();
      AuthorizationService service = getIt.get<AuthorizationService>();
      var data = await service.getAuthorizedByPwd(event.account, event.password);
      yield data.fold(
        (failure) => PwdFormState.failure(),
        (authorization) => PwdFormState.success(),
      );
    }
  }
}
