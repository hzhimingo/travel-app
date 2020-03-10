part of 'topic_pool_bloc.dart';

abstract class TopicPoolEvent extends Equatable {
  const TopicPoolEvent();
}

class InitializeTopicPool extends TopicPoolEvent {
  @override
  List<Object> get props => [];
}

class LoadMoreTopicCovers extends TopicPoolEvent {
  @override
  List<Object> get props => [];
}