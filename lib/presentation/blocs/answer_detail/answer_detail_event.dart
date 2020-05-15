part of 'answer_detail_bloc.dart';

abstract class AnswerDetailEvent extends Equatable {
  const AnswerDetailEvent();
}

class FetchAnswerDetail extends AnswerDetailEvent {
  final int answerId;

  FetchAnswerDetail({this.answerId});

  @override
  List<Object> get props => [answerId];
}