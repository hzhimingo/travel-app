part of 'topic_detail_bloc.dart';

abstract class TopicDetailEvent extends Equatable {
  const TopicDetailEvent();
}

class LoadTopicDetail extends TopicDetailEvent {
  final int topicId;

  LoadTopicDetail({this.topicId});

  @override
  List<Object> get props => [topicId];
}