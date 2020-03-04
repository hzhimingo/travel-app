part of 'authorization_bloc.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();
}

class UnAuthorized extends AuthorizationState {
  @override
  List<Object> get props => [];
}

class Authorized extends AuthorizationState {
  @override
  List<Object> get props => [];
}
