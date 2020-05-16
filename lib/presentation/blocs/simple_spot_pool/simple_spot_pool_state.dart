part of 'simple_spot_pool_bloc.dart';

abstract class SimpleSpotPoolState extends Equatable {
  const SimpleSpotPoolState();
}

class SimpleSpotPoolEmpty extends SimpleSpotPoolState {
  @override
  List<Object> get props => [];
}

class SimpleSpotPoolLoaded extends SimpleSpotPoolState {
  final List<SimpleSpot> simpleSpots;

  SimpleSpotPoolLoaded({this.simpleSpots});
  @override
  List<Object> get props => [simpleSpots];
}

class SimpleSpotPoolLoading extends SimpleSpotPoolState {
  @override
  List<Object> get props => [];
}

class SimpleSpotPoolLoadFailed extends SimpleSpotPoolState {
  @override
  List<Object> get props => [];
}
