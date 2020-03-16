part of 'topic_detail_bloc.dart';

abstract class TopicDetailState extends Equatable {
  const TopicDetailState();
}

class TopicDetailLoading extends TopicDetailState {
  @override
  List<Object> get props => [];
}

class TopicDetailLoaded extends TopicDetailState {
  final TopicDetail topicDetail;

  TopicDetailLoaded({this.topicDetail});
  
  @override
  List<Object> get props => [topicDetail];
}

class TopicDetailLoadFailure extends TopicDetailState {
  @override
  List<Object> get props => [];
}
