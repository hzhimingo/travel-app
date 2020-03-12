part of 'topic_detail_bloc.dart';

abstract class TopicDetailState extends Equatable {
  const TopicDetailState();
}

class Active extends TopicDetailState {
  final bool flag;

  Active({this.flag});
  @override
  List<Object> get props => [flag];
}

class Disable extends TopicDetailState {
  final bool flag;

  Disable({this.flag});
  @override
  List<Object> get props => [flag];
}
