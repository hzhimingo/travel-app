import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/core/util/validators.dart';

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
        account: event.account,
        isAccountValided: Validators.isAccount(event.account),
      );
    }
    if (event is PasswordChanged) {
      yield state.update(
        password: event.password,
        isPasswordValided: Validators.isPassword(event.password),
      );
    }
  }
}
