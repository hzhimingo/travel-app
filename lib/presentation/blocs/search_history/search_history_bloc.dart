import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/service/search_service.dart';

part 'search_history_event.dart';
part 'search_history_state.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  final SearchService searchService;

  SearchHistoryBloc({this.searchService});

  @override
  SearchHistoryState get initialState => SearchHistoryState(searchHistories: []);

  @override
  Stream<SearchHistoryState> mapEventToState(
    SearchHistoryEvent event,
  ) async* {
    final currentState = state;
    if (event is ResumeSearchHistory) {
      var data = await searchService.fetchSearchHistory();
      yield data.fold(
        (failure) => SearchHistoryState(searchHistories: []),
        (list) => SearchHistoryState(searchHistories: list),
      );
    }
    if (event is AddSearchHistory) {
      var data = await searchService.addSearchHistory(event.searchWords);
      yield data.fold(
        (failure) =>
            SearchHistoryState(searchHistories: currentState.searchHistories),
        (list) => SearchHistoryState(searchHistories: list),
      );
    }
    if (event is ClearAllSearchHistory) {
      var data = await searchService.removeAllSearchHistory();
      yield data.fold(
        (failure) =>
            SearchHistoryState(searchHistories: currentState.searchHistories),
        (list) => SearchHistoryState(searchHistories: []),
      );
    }
  }
}
