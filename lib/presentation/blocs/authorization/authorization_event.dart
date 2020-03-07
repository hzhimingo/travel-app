part of 'authorization_bloc.dart';

abstract class AuthorizationEvent extends Equatable {
  const AuthorizationEvent();
}

class InitAuthorized extends AuthorizationEvent {
  @override
  List<Object> get props => [];
}

class SetAuthorized extends AuthorizationEvent {
  final Authorization authorization;

  SetAuthorized({this.authorization});
  @override
  List<Object> get props => [authorization];
}

class RemoveAuthorized extends AuthorizationEvent {
  @override
  List<Object> get props => [];
}
