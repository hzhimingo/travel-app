part of 'current_user_bloc.dart';

abstract class CurrentUserEvent extends Equatable {
  const CurrentUserEvent();
}

class RemoveCurrentUser extends CurrentUserEvent {
  @override
  List<Object> get props => [];
}

class UpdateCurrentUser extends CurrentUserEvent {
  @override
  List<Object> get props => [];
}

class RefreshCurrentUser extends CurrentUserEvent {
  @override
  List<Object> get props => [];
}
