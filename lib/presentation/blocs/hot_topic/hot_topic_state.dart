part of 'hot_topic_bloc.dart';

abstract class HotTopicState extends Equatable {
  const HotTopicState();
}

class HotTopicLoading extends HotTopicState {
  @override
  List<Object> get props => [];
}

class HotTopicEmpty extends HotTopicState {
  @override
  List<Object> get props => [];
}

class HotTopicLoaded extends HotTopicState {
  final List<TopicCover> topicCovers;

  HotTopicLoaded({this.topicCovers});
  @override
  List<Object> get props => [topicCovers];
}
