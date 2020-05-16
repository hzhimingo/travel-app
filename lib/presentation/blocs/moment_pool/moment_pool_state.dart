part of 'moment_pool_bloc.dart';

abstract class MomentPoolState extends Equatable {
  const MomentPoolState();
}

class MomentPoolInitializing extends MomentPoolState {
  MomentPoolInitializing();

  @override
  List<Object> get props => [];
}

class MomentPoolEmpty extends MomentPoolState {
  MomentPoolEmpty();

  @override
  List<Object> get props => [];
}

class MomentPoolLoading extends MomentPoolState {
  MomentPoolLoading();

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

  MomentPoolLoadFailure();
  @override
  List<Object> get props => [];
}
