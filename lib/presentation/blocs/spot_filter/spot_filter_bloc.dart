import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'spot_filter_event.dart';
part 'spot_filter_state.dart';

class SpotFilterBloc extends Bloc<SpotFilterEvent, SpotFilterState> {
  @override
  SpotFilterState get initialState => SpotFilterState.defaultClose();

  @override
  Stream<SpotFilterState> mapEventToState(
    SpotFilterEvent event,
  ) async* {
    if (event is OpenSpotFilter) {
      yield state.update(
        isFilterOpen: true,
        currentFilter: event.index,
      );
    }
    if (event is CloseSpotFilterNoParams) {
      yield state.update(
        isFilterOpen: false,
      );
    }
    if (event is CloseAndUpdateSpotFilter) {
      yield state.update(
        isFilterOpen: false,
        currentFilter: event.updateFilterIndex,
        newTag: event.newTag,
      );
    }
  }
}
