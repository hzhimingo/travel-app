import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/service/authorization_service.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final AuthorizationService authorizationService;

  AuthorizationBloc({this.authorizationService});

  @override
  AuthorizationState get initialState => UnAuthorized();

  @override
  Stream<AuthorizationState> mapEventToState(
    AuthorizationEvent event,
  ) async* {
    if (event is ResumeAuthorized) {
      var data = await authorizationService.hasGrantedAuthorized();
      yield data.fold(
        (failure) => UnAuthorized(),
        (hasAuthorized) => hasAuthorized ? Authorized() : UnAuthorized(),
      );
    }
    if (event is GrantAuthorized) {
      yield Authorized();
    }
    if (event is RevokeAuthorized) {
      var data = await authorizationService.removeAuthorized();
      yield data.fold(
        (failure) => Authorized(),
        (success) => UnAuthorized(),
      );
    }
  }
}
