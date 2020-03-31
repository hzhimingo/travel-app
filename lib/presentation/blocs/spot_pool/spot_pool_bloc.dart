import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/spot.dart';
import 'package:travel/entity/spot_filter.dart';
import 'package:travel/presentation/pages/spot_pool/components/components.dart';
import 'package:travel/service/spot_service.dart';

part 'spot_pool_event.dart';
part 'spot_pool_state.dart';

class SpotPoolBloc extends Bloc<SpotPoolEvent, SpotPoolState> {
  final SpotService spotService;

  SpotPoolBloc({this.spotService});

  @override
  SpotPoolState get initialState => SpotPoolUninitialized();

  @override
  Stream<SpotPoolState> mapEventToState(
    SpotPoolEvent event,
  ) async* {
    final currentState = state;
    if (event is InitializeSpotPool) {
      //初始化
      yield SpotPoolInitializing();
      var data = await spotService.fetchSpotFilterAndList();
      yield data.fold(
        (failure) => SpotPoolInitializeFailed(),
        (list) => SpotPoolLoaded.initialized(
          filters: list.first,
          spots: list.last,
        ),
      );
    }
    if (event is CloseFilterWithNoParams) {
      //不请求数据
      if (currentState is SpotPoolLoaded) {
        yield currentState.update(isNeedBuild: false);
      }
    }
    if (event is CloseAndUpdateFilter) {
      //需要请求数据
      if (currentState is SpotPoolLoaded) {
        List<SpotFilter> spotFilters = currentState.filters;
        spotFilters[event.filterIndex].currentNo = event.no;
        yield currentState.update(
          isNeedBuild: true,
          isReloading: true,
          isFilterOpen: false,
          filters: spotFilters,
        );
        var data = await spotService.fetchSpots({'city': 123123});
        yield data.fold(
          (failure) => currentState.update(
            isNeedBuild: true,
            isReloading: false,
            isFilterOpen: false,
          ),
          (list) => currentState.update(
            isNeedBuild: true,
            isReloading: false,
            isFilterOpen: false,
            spots: list,
          ),
        );
      }
    }
    if (event is CloseCurrentFilter) {
      if (currentState is SpotPoolLoaded) {
        yield currentState.update(isFilterOpen: false);
      }
    }
    if (event is OpenFilter) {
      if (currentState is SpotPoolLoaded) {
        if (currentState.currentFilter == event.index) {
          yield currentState.update(isFilterOpen: true);
        } else {
          if (currentState.isFilterOpen) {
            yield currentState.update(currentFilter: event.index);
          } else {
            yield currentState.update(
              isFilterOpen: true,
              currentFilter: event.index,
            );
          }
        }
      }
    }
  }
}
