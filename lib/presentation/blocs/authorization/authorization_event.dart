part of 'authorization_bloc.dart';

abstract class AuthorizationEvent extends Equatable {
  const AuthorizationEvent();
}

class ResumeAuthorized extends AuthorizationEvent {
  @override
  List<Object> get props => [];
}

class GrantAuthorized extends AuthorizationEvent {
  @override
  List<Object> get props => [];
}

class RevokeAuthorized extends AuthorizationEvent {
  @override
  List<Object> get props => [];
}
