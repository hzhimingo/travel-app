import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/topic_cover.dart';
import 'package:travel/service/topic_service.dart';

part 'topic_pool_event.dart';
part 'topic_pool_state.dart';

class TopicPoolBloc extends Bloc<TopicPoolEvent, TopicPoolState> {
  final TopicService topicService;

  TopicPoolBloc({this.topicService});

  @override
  TopicPoolState get initialState => TopicPoolEmpty();

  @override
  Stream<TopicPoolState> mapEventToState(
    TopicPoolEvent event,
  ) async* {
    final currentState = state;
    if (event is InitializeTopicPool) {
      yield TopicPoolInitializing();
      var data = await topicService.fetchTopicCovers();
      yield data.fold(
        (failure) => TopicPoolEmpty(),
        (topicCovers) => TopicPoolLoaded(topicCovers: topicCovers),
      );
    }
    if (event is LoadMoreTopicCovers) {
      yield TopicPoolLoading();
      var data = await topicService.fetchTopicCovers();
      yield data.fold(
        (failure) => TopicPoolLoadFailure(),
        (topicCovers) {
          if (currentState is TopicPoolLoaded) {
            return TopicPoolLoaded(topicCovers: currentState.topicCovers + topicCovers);
          } else {
            return TopicPoolLoaded(topicCovers: topicCovers);
          }
        },
      );
    }
  }
}
