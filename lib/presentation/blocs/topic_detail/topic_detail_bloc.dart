import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'topic_detail_event.dart';
part 'topic_detail_state.dart';

class TopicDetailBloc extends Bloc<TopicDetailEvent, TopicDetailState> {
  @override
  TopicDetailState get initialState => Disable();

  @override
  Stream<TopicDetailState> mapEventToState(
    TopicDetailEvent event,
  ) async* {
    if (event is Change) {
      if (event.flag) {
        yield Active();
      } else {
        yield Disable();
      }
    }
  }
}
