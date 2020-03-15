part of 'question_detail_bloc.dart';

abstract class QuestionDetailEvent extends Equatable {
  const QuestionDetailEvent();
}

class InitializeQuestionDetail extends QuestionDetailEvent {
  final int questionId;

  InitializeQuestionDetail({this.questionId});
  @override
  List<Object> get props => [questionId];
}
