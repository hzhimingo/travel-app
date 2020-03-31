part of 'spot_pool_bloc.dart';

abstract class SpotPoolEvent extends Equatable {
  const SpotPoolEvent();
}

class InitializeSpotPool extends SpotPoolEvent {
  @override
  List<Object> get props => [];
}

class CloseFilterWithNoParams extends SpotPoolEvent {
  @override
  List<Object> get props => [];
}

class CloseAndUpdateFilter extends SpotPoolEvent {
  final int filterIndex;
  final int no;

  CloseAndUpdateFilter({this.filterIndex, this.no});
  @override
  List<Object> get props => [filterIndex, no];
}

class CloseCurrentFilter extends SpotPoolEvent {
  @override
  List<Object> get props => [];
}

class OpenFilter extends SpotPoolEvent {
  final int index;

  OpenFilter({this.index});

  @override
  List<Object> get props => [index];

}
