part of 'hot_topic_bloc.dart';

abstract class HotTopicEvent extends Equatable {
  const HotTopicEvent();
}

class FetchHotTopic extends HotTopicEvent {
  @override
  List<Object> get props => [];
}

class RefreshHotTopic extends HotTopicEvent {
  @override
  List<Object> get props => [];
}