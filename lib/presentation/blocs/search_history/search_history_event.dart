part of 'search_history_bloc.dart';

abstract class SearchHistoryEvent extends Equatable {
  const SearchHistoryEvent();
}

class AddSearchHistory extends SearchHistoryEvent {
  final String searchWords;

  AddSearchHistory({this.searchWords});
  @override
  List<Object> get props => [searchWords];
}

class ResumeSearchHistory extends SearchHistoryEvent {
  @override
  List<Object> get props => [];
}

class ClearAllSearchHistory extends SearchHistoryEvent {
  @override
  List<Object> get props => [];
}
