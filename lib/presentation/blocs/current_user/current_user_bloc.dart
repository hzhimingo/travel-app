import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/user.dart';
import 'package:travel/service/user_service.dart';

part 'current_user_event.dart';
part 'current_user_state.dart';

class CurrentUserBloc extends Bloc<CurrentUserEvent, CurrentUserState> {
  final UserService userService;

  CurrentUserBloc({this.userService});

  @override
  CurrentUserState get initialState => CurrentUserEmpty();

  @override
  Stream<CurrentUserState> mapEventToState(
    CurrentUserEvent event,
  ) async* {
    if (event is RefreshCurrentUser) {
      var data = await userService.getLocalCurrentUser();
      yield data.fold(
        (failure) => CurrentUserEmpty(),
        (user) => CurrentUserLoaded(currentUser: user),
      );
    }
    if (event is RemoveCurrentUser) {
      var data = await userService.removeLocalCurrentUser();
      yield data.fold(
        (failure) => state,
        (success) => CurrentUserEmpty(),
      );
    }
    if (event is UpdateCurrentUser) {

    }
  }
}
