import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/service/question_service.dart';

part 'edit_question_event.dart';
part 'edit_question_state.dart';

class EditQuestionBloc extends Bloc<EditQuestionEvent, EditQuestionState> {

  final QuestionService questionService;

  EditQuestionBloc({this.questionService});

  @override
  EditQuestionState get initialState => EditQuestionEmpty();

  @override
  Stream<EditQuestionState> mapEventToState(
    EditQuestionEvent event,
  ) async* {
    if (event is SubmitQuestion) {
      yield SubmitQuestionIng();
      var result = await questionService.submitQuestion(event.userId, event.title, event.content);
      yield result.fold(
        (failure) => SubmitQuestionFailed(),
        (success) => SubmitQuestionSuccess(),
      );
    }
  }
}
