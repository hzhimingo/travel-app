import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/answer_cover.dart';
import 'package:travel/entity/page.dart';
import 'package:travel/service/answer_service.dart';

part 'answer_pool_event.dart';
part 'answer_pool_state.dart';

class AnswerPoolBloc extends Bloc<AnswerPoolEvent, AnswerPoolState> {
  final AnswerService answerService;

  AnswerPoolBloc({this.answerService});

  @override
  AnswerPoolState get initialState => AnswerPoolEmpty();

  @override
  Stream<AnswerPoolState> mapEventToState(
    AnswerPoolEvent event,
  ) async* {
    final currentState = state;
    if (event is InitializeAnswerPool) {
      yield AnswerPoolInitializing();
      var data = await answerService.fetchAnswerCovers(
          event.questionId, event.userId, 0, 15);
      yield data.fold(
        (faliure) => AnswerPoolInitializeFailure(),
        (page) => AnswerPoolLoaded(page: page),
      );
    }
    if (event is RefreshAnswerCovers) {
      yield AnswerPoolLoading();
      var data = await answerService.fetchAnswerCovers(
        event.questionId,
        event.userId,
        event.boundary,
        event.offset,
      );
      yield data.fold(
        (faliure) => AnswerPoolInitializeFailure(),
        (page) => AnswerPoolLoaded(page: page),
      );
    }
    if (event is LoadMoreAnswerCovers) {
      yield AnswerPoolLoading();
      var data = await answerService.fetchAnswerCovers(
          event.questionId, event.userId, event.boundary, event.offset);
      yield data.fold(
        (faliure) => AnswerPoolLoadFailure(),
        (page) {
          if (currentState is AnswerPoolLoaded) {
            page.data = currentState.page.data + page.data;
            return AnswerPoolLoaded(page: page);
          } else {
            return AnswerPoolLoadFailure();
          }
        },
      );
    }
  }
}
