import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/page.dart';
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
      var data = await questionService.fetchQuestionCovers(0, 15);
      yield data.fold(
        (faliure) => QuestionPoolInitializeFailure(),
        (page) => QuestionPoolLoaded(page: page),
      );
    }
    if (event is LoadMoreQuestionCovers) {
      yield QuestionPoolLoading();
      var data = await questionService.fetchQuestionCovers(event.boundary, event.offset);
      yield data.fold(
        (faliure) => QuestionPoolLoadFailure(),
        (page) {
          if (currentState is QuestionPoolLoaded) {
            page.data = currentState.page.data + page.data;
            return QuestionPoolLoaded(page: page);
          } else {
            return QuestionPoolLoadFailure();
          }
        },
      );
    }
    if (event is RefreshQuestionCovers) {
      yield QuestionPoolLoading();
      var data = await questionService.fetchQuestionCovers(event.boundary, event.offset);
      yield data.fold(
        (failure) => QuestionPoolLoadFailure(),
        (page) => QuestionPoolLoaded(page: page)
      );
    }
  }
}
