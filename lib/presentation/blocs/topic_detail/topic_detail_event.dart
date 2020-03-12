part of 'topic_detail_bloc.dart';

abstract class TopicDetailEvent extends Equatable {
  const TopicDetailEvent();
}

class Change extends TopicDetailEvent {
  final bool flag;

  Change({this.flag});
  @override
  List<Object> get props => [flag];
}