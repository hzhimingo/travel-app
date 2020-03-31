part of 'search_history_bloc.dart';

class SearchHistoryState extends Equatable {
  final List<String> searchHistories;

  SearchHistoryState({@required this.searchHistories});
  @override
  List<Object> get props => [searchHistories];
}
