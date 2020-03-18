part of 'spot_filter_bloc.dart';

abstract class SpotFilterEvent extends Equatable {
  const SpotFilterEvent();
}

class CloseSpotFilterNoParams extends SpotFilterEvent {
  @override
  List<Object> get props => [];
}

class CloseSpotFilterWithParams extends SpotFilterEvent {
  final int currentFilter;
  final int newTag;

  CloseSpotFilterWithParams({this.currentFilter, this.newTag});

  @override
  List<Object> get props => [newTag, currentFilter];
}

class CloseAndUpdateSpotFilter extends SpotFilterEvent {
  final int updateFilterIndex;
  final int newTag;

  CloseAndUpdateSpotFilter({this.updateFilterIndex, this.newTag});

  @override
  List<Object> get props => [newTag, updateFilterIndex];
}

class OpenSpotFilter extends SpotFilterEvent {
  final int index;

  OpenSpotFilter({this.index});

  @override
  List<Object> get props => [index];
}
