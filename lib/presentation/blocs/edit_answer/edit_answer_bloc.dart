import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/service/answer_service.dart';

part 'edit_answer_event.dart';
part 'edit_answer_state.dart';

class EditAnswerBloc extends Bloc<EditAnswerEvent, EditAnswerState> {
  final AnswerService answerService;

  EditAnswerBloc({this.answerService});

  @override
  EditAnswerState get initialState => EditAnswerEmpty();

  @override
  Stream<EditAnswerState> mapEventToState(
    EditAnswerEvent event,
  ) async* {
    if (event is SubmitAnswer) {
      yield SubmitAnswerIng();
      var result = await answerService.postAnswer(
        event.userId,
        event.content,
        event.question,
        event.pics,
      );
      yield result.fold(
        (failure) => SubmitAnswerFailed(),
        (success) => SubmitAnswerSuccess(),
      );
    }
  }
}
