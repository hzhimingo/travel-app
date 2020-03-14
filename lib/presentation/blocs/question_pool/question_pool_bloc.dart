import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/question_cover.dart';
import 'package:travel/service/question_service.dart';

part 'question_pool_event.dart';
part 'question_pool_state.dart';

class QuestionPoolBloc extends Bloc<QuestionPoolEvent, QuestionPoolState> {
  final QuestionService questionService;

  QuestionPoolBloc({this.questionService});

  @override
  QuestionPoolState get initialState => QuestionPoolEmpty();

  @override
  Stream<QuestionPoolState> mapEventToState(
    QuestionPoolEvent event,
  ) async* {
    final currentState = state;
    if (event is InitializeQuestionPool) {
      yield QuestionPoolInitializing();
      var data = await questionService.fetchQuestionCovers();
      yield data.fold(
        (faliure) => QuestionPoolInitializeFailure(),
        (questionCovers) => QuestionPoolLoaded(questionCovers: questionCovers),
      );
    }
    if (event is LoadMoreQuestionCovers) {
      yield QuestionPoolLoading();
      var data = await questionService.fetchQuestionCovers();
      yield data.fold(
        (faliure) => QuestionPoolLoadFailure(),
        (questionCovers) {
          if (currentState is QuestionPoolLoaded) {
            return QuestionPoolLoaded(questionCovers: currentState.questionCovers + questionCovers);
          } else {
            return QuestionPoolLoaded(questionCovers: questionCovers);
          }
        },
      );
    }
  }
}
