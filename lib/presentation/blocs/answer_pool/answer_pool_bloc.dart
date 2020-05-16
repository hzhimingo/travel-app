import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/answer_cover.dart';
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
      var data = await answerService.fetchAnswerCovers(event.questionId, event.userId);
      yield data.fold(
        (faliure) => AnswerPoolInitializeFailure(),
        (answerCovers) => AnswerPoolLoaded(answerCovers: answerCovers),
      );
    }  
    if (event is LoadMoreAnswerCovers) {
      yield AnswerPoolLoading();
      var data = await answerService.fetchAnswerCovers(event.questionId, event.userId);
      yield data.fold(
        (faliure) =>AnswerPoolLoadFailure(),
        (answerCovers) {
          if (currentState is AnswerPoolLoaded) {
            return AnswerPoolLoaded(answerCovers: currentState.answerCovers + answerCovers);
          } else {
            return AnswerPoolLoaded(answerCovers: answerCovers);
          }
        },
      );
    }
  }
}
