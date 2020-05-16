part of 'answer_detail_bloc.dart';

abstract class AnswerDetailEvent extends Equatable {
  const AnswerDetailEvent();
}

class FetchAnswerDetail extends AnswerDetailEvent {
  final int answerId;
  final int userId;

  FetchAnswerDetail({this.answerId, this.userId});

  @override
  List<Object> get props => [answerId, userId];
}