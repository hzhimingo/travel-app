part of 'current_user_bloc.dart';

abstract class CurrentUserState extends Equatable {
  const CurrentUserState();
}

class CurrentUserEmpty extends CurrentUserState {
  @override
  List<Object> get props => [];
}

class CurrentUserLoaded extends CurrentUserState {
  final User currentUser;

  CurrentUserLoaded({this.currentUser});
  @override
  List<Object> get props => [currentUser];
}
