import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/topic_cover.dart';
import 'package:travel/service/topic_service.dart';

part 'hot_topic_event.dart';
part 'hot_topic_state.dart';

class HotTopicBloc extends Bloc<HotTopicEvent, HotTopicState> {
  final TopicService topicService;

  HotTopicBloc({this.topicService});

  @override
  HotTopicState get initialState => HotTopicEmpty();

  @override
  Stream<HotTopicState> mapEventToState(
    HotTopicEvent event,
  ) async* {
    if (event is FetchHotTopic) {
      yield HotTopicLoading();
      var data = await topicService.fetchHotTopic();
      yield data.fold(
        (failure) => HotTopicEmpty(),
        (topicCovers) => HotTopicLoaded(topicCovers: topicCovers),
      );
    }
    if (event is RefreshHotTopic) {
      yield HotTopicLoading();
      var data = await topicService.fetchHotTopic();
      yield data.fold(
        (failure) => HotTopicEmpty(),
        (topicCovers) => HotTopicLoaded(topicCovers: topicCovers),
      );
    }
  }
}
