import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/moment_cover.dart';
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
      print("GET DATA");
      yield MomentPoolInitializing();
      var data = await momentService.fetchMomentCovers();
      yield data.fold(
        (faliure) => MomentPoolEmpty(),
        (momentCovers) => MomentPoolLoaded(momentCovers: momentCovers),
      );
    }
    if (event is RefreshMomentPool) {
      yield MomentPoolLoading();
      var data = await momentService.fetchMomentCovers();
      yield data.fold(
        (faliure) => MomentPoolLoadFailure(),
        (momentCovers) => MomentPoolLoaded(momentCovers: momentCovers),
      );
    }
    if (event is LoadMoreMomentCovers) {
      print("GET DATA");
      yield MomentPoolLoading();
      var data = await momentService.fetchMomentCovers();
      yield data.fold(
        (faliure) => MomentPoolLoadFailure(),
        (momentCovers) {
          if (currentState is MomentPoolLoaded) {
            return MomentPoolLoaded(momentCovers: currentState.momentCovers + momentCovers);
          } else {
            return MomentPoolLoaded(momentCovers: momentCovers);
          }
        },
      );
    }
  }
}
