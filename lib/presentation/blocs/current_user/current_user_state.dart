part of 'current_user_bloc.dart';

abstract class CurrentUserState extends Equatable {
  const CurrentUserState();
}

class CurrentUserInitial extends CurrentUserState {
  @override
  List<Object> get props => [];
}
