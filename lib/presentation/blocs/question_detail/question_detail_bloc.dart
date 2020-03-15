import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/question_detail.dart';
import 'package:travel/service/question_service.dart';

part 'question_detail_event.dart';
part 'question_detail_state.dart';

class QuestionDetailBloc extends Bloc<QuestionDetailEvent, QuestionDetailState> {
  final QuestionService questionService;

  QuestionDetailBloc({this.questionService});

  @override
  QuestionDetailState get initialState => QuestionDetailLoading();

  @override
  Stream<QuestionDetailState> mapEventToState(
    QuestionDetailEvent event,
  ) async* {
    if (event is InitializeQuestionDetail) {
      var data = await questionService.fetchQuestionDetail(event.questionId);
      yield data.fold(
        (failure) => QuestionDetailLoadFailure(),
        (questionDetail) => QuestionDetailLoaded(questionDetail: questionDetail),
      );
    }
  }
}
