import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/answer_detail.dart';
import 'package:travel/service/answer_service.dart';

part 'answer_detail_event.dart';
part 'answer_detail_state.dart';

class AnswerDetailBloc extends Bloc<AnswerDetailEvent, AnswerDetailState> {

  final AnswerService answerService;

  AnswerDetailBloc({this.answerService});

  @override
  AnswerDetailState get initialState => AnswerDetailEmpty();

  @override
  Stream<AnswerDetailState> mapEventToState(
    AnswerDetailEvent event,
  ) async* {
    if (event is FetchAnswerDetail) {
      var result = await answerService.fetchAnswerDetail(event.answerId, event.userId);
      yield result.fold(
        (failure) => AnswerDetailLoadFail(),
        (answerDetail) => AnswerDetailLoaded(detail: answerDetail)
      );
    }
  }
}
