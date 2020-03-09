part of 'moment_pool_bloc.dart';

abstract class MomentPoolEvent extends Equatable {
  const MomentPoolEvent();
}

class InitializeMomentPool extends MomentPoolEvent {
  @override
  List<Object> get props => [];
}

class RefreshMomentPool extends MomentPoolEvent {
  @override
  List<Object> get props => [];
}

class LoadMoreMomentCovers extends MomentPoolEvent {
  @override
  List<Object> get props => [];
}
