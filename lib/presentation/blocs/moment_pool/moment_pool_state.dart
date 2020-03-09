part of 'moment_pool_bloc.dart';

abstract class MomentPoolState extends Equatable {
  const MomentPoolState();
}

class MomentPoolInitializing extends MomentPoolState {
  @override
  List<Object> get props => [];
}

class MomentPoolEmpty extends MomentPoolState {
  @override
  List<Object> get props => [];
}

class MomentPoolLoading extends MomentPoolState {
  @override
  List<Object> get props => [];
}

class MomentPoolLoaded extends MomentPoolState {
  final List<MomentCover> momentCovers;

  MomentPoolLoaded({@required this.momentCovers});

  @override
  List<Object> get props => [this.momentCovers];
}

class MomentPoolLoadFailure extends MomentPoolState {
  @override
  List<Object> get props => [];
}
