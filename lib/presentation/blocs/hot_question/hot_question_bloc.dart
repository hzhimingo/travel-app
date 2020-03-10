import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hot_question_event.dart';
part 'hot_question_state.dart';

class HotQuestionBloc extends Bloc<HotQuestionEvent, HotQuestionState> {
  @override
  HotQuestionState get initialState => HotQuestionInitial();

  @override
  Stream<HotQuestionState> mapEventToState(
    HotQuestionEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
