import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/service/collect_service.dart';

part 'collect_event.dart';
part 'collect_state.dart';

class CollectBloc extends Bloc<CollectEvent, CollectState> {

  final CollectService collectService;

  CollectBloc({this.collectService});

  @override
  CollectState get initialState => UnCollect();

  @override
  Stream<CollectState> mapEventToState(
    CollectEvent event,
  ) async* {
    if (event is ActionCollect) {
      var result = await collectService.collect(
        event.userId,
        event.serviceBusinessId,
        event.typeId,
      );
      yield result.fold(
        (failure) => CollectFailed(),
        (success) => Collected()
      );
    }
    if (event is CancelCollect) {
      var result = await collectService.cancelCollect(event.userId, event.serviceBusinessId);
      yield result.fold(
        (failure) => CancelCollectFailed(),
        (success) => UnCollect()
      );
    }
  }
}
