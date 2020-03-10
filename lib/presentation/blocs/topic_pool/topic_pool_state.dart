part of 'topic_pool_bloc.dart';

abstract class TopicPoolState extends Equatable {
  const TopicPoolState();
}

class TopicPoolInitializing extends TopicPoolState {
  @override
  List<Object> get props => [];
}

class TopicPoolEmpty extends TopicPoolState {
  @override
  List<Object> get props => [];
}

class TopicPoolLoading extends TopicPoolState {
  @override
  List<Object> get props => [];
}

class TopicPoolLoaded extends TopicPoolState {
  final List<TopicCover> topicCovers;

  TopicPoolLoaded({this.topicCovers});
  @override
  List<Object> get props => [topicCovers];
}

class TopicPoolLoadFailure extends TopicPoolState {
  @override
  List<Object> get props => [];
}
