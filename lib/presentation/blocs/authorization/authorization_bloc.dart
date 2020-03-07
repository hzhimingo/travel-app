import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/authorization.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/service/authorization_service.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  @override
  AuthorizationState get initialState => UnAuthorized();

  @override
  Stream<AuthorizationState> mapEventToState(
    AuthorizationEvent event,
  ) async* {
    if (event is SetAuthorized) {
      yield Authorized(authorization: event.authorization);
    }

    if (event is InitAuthorized) {
      AuthorizationService service = getIt.get<AuthorizationService>();
      var data = await service.getLocalAuthorized();
      yield data.fold(
        (failure) => UnAuthorized(),
        (authorization) => Authorized(authorization: authorization),
      );
    }

    if (event is RemoveAuthorized) {
      AuthorizationService service = getIt.get<AuthorizationService>();
      var data = await service.removeAuthorized();
      yield data.fold(
        (failure) => Authorized(),
        (suceess) => UnAuthorized(),
      );
    }
  }
}
