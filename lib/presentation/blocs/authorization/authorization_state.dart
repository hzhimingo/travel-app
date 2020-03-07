part of 'authorization_bloc.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();
}

class AuthorizationInitial extends AuthorizationState {
  @override
  List<Object> get props => [];
}
