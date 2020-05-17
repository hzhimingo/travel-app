part of 'moment_pool_bloc.dart';

abstract class MomentPoolEvent extends Equatable {
  const MomentPoolEvent();
}

class InitializeMomentPool extends MomentPoolEvent {
  @override
  List<Object> get props => [];
}

class RefreshMomentPool extends MomentPoolEvent {
  final int boundary;
  final int offset;

  RefreshMomentPool({this.boundary, this.offset});
  @override
  List<Object> get props => [boundary, offset];
}

class LoadMoreMomentCovers extends MomentPoolEvent {
  final int boundary;
  final int offset;

  LoadMoreMomentCovers({this.boundary, this.offset});

  @override
  List<Object> get props => [boundary, offset];
}
