part of 'current_user_bloc.dart';

abstract class CurrentUserState extends Equatable {
  const CurrentUserState();
}

//没有用户信息
class CurrentUserEmpty extends CurrentUserState {
  @override
  List<Object> get props => [];
}

//用户信息加载完成
class CurrentUserLoaded extends CurrentUserState {
  final User user;

  CurrentUserLoaded({this.user});
  @override
  List<Object> get props => [user];
}

//用户信息加载中
class CurrentUserLoading extends CurrentUserState {
  @override
  List<Object> get props => [];
}
