import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/moment_cover.dart';
import 'package:travel/entity/page.dart';
import 'package:travel/service/moment_service.dart';

part 'moment_pool_event.dart';
part 'moment_pool_state.dart';

class MomentPoolBloc extends Bloc<MomentPoolEvent, MomentPoolState> {
  final MomentService momentService;

  MomentPoolBloc({this.momentService});

  @override
  MomentPoolState get initialState => MomentPoolEmpty();

  @override
  Stream<MomentPoolState> mapEventToState(
    MomentPoolEvent event,
  ) async* {
    final currentState = state;
    if (event is InitializeMomentPool) {
      yield MomentPoolInitializing();
      var data = await momentService.fetchMomentCovers(0, 15);
      yield data.fold(
        (faliure) => MomentPoolEmpty(),
        (page) => MomentPoolLoaded(page: page),
      );
    }
    if (event is RefreshMomentPool) {
      yield MomentPoolLoading();
      var data = await momentService.fetchMomentCovers(event.boundary, event.offset);
      yield data.fold(
        (faliure) => MomentPoolLoadFailure(),
        (page) => MomentPoolLoaded(page: page),
      );
    }
    if (event is LoadMoreMomentCovers) {
      yield MomentPoolLoading();
      print("${event.boundary} ${event.offset}");
      var data = await momentService.fetchMomentCovers(event.boundary, event.offset);
      yield data.fold(
        (faliure) => MomentPoolLoadFailure(),
        (page) {
          if (currentState is MomentPoolLoaded) {
            page.data = currentState.page.data + page.data;
            return MomentPoolLoaded(page: page);
          } else {
            return MomentPoolLoadFailure();
          }
        },
      );
    }
  }
}
