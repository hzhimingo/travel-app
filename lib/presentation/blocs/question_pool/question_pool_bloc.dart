import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'question_pool_event.dart';
part 'question_pool_state.dart';

class QuestionPoolBloc extends Bloc<QuestionPoolEvent, QuestionPoolState> {
  @override
  QuestionPoolState get initialState => QuestionPoolInitial();

  @override
  Stream<QuestionPoolState> mapEventToState(
    QuestionPoolEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
