import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/simple_spot.dart';
import 'package:travel/service/spot_service.dart';

part 'simple_spot_pool_event.dart';
part 'simple_spot_pool_state.dart';

class SimpleSpotPoolBloc extends Bloc<SimpleSpotPoolEvent, SimpleSpotPoolState> {

  final SpotService spotService;

  SimpleSpotPoolBloc({this.spotService});

  @override
  SimpleSpotPoolState get initialState => SimpleSpotPoolEmpty();

  @override
  Stream<SimpleSpotPoolState> mapEventToState(
    SimpleSpotPoolEvent event,
  ) async* {
    if (event is FetchSimpleSpot) {
      yield SimpleSpotPoolLoading();
      var result = await spotService.fetchSimplSpots(event.city);
      yield result.fold(
        (failure) => SimpleSpotPoolLoadFailed(),
        (data) => SimpleSpotPoolLoaded(simpleSpots: data),
      );
    }
  }
}
