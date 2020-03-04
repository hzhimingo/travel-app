part of 'authorization_bloc.dart';

abstract class AuthorizationEvent extends Equatable {
  const AuthorizationEvent();
}

class ChangeToAuthorized extends AuthorizationEvent {
  @override
  List<Object> get props => [];
}
