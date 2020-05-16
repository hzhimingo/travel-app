part of 'simple_spot_pool_bloc.dart';

abstract class SimpleSpotPoolEvent extends Equatable {
  const SimpleSpotPoolEvent();
}

class FetchSimpleSpot extends SimpleSpotPoolEvent {

  final int city;

  FetchSimpleSpot({this.city});

  @override
  List<Object> get props => [city];
}
