import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/topic_detail.dart';
import 'package:travel/service/topic_service.dart';

part 'topic_detail_event.dart';
part 'topic_detail_state.dart';

class TopicDetailBloc extends Bloc<TopicDetailEvent, TopicDetailState> {

  final TopicService topicService;

  TopicDetailBloc({this.topicService});

  @override
  TopicDetailState get initialState => TopicDetailLoading();

  @override
  Stream<TopicDetailState> mapEventToState(
    TopicDetailEvent event,
  ) async* {
    if (event is LoadTopicDetail) {
      print(event.topicId);
      var data = await topicService.fetchTopicDetail(event.topicId);
      yield data.fold(
        (failure) => TopicDetailLoadFailure(),
        (topicDetail) => TopicDetailLoaded(topicDetail: topicDetail),
      );
    }
  }
}
