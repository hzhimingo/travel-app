part of 'question_pool_bloc.dart';

abstract class QuestionPoolEvent extends Equatable {
  const QuestionPoolEvent();
}

class InitializeQuestionPool extends QuestionPoolEvent {
  @override
  List<Object> get props => [];
}

class LoadMoreQuestionCovers extends QuestionPoolEvent {
  final int boundary;
  final int offset;

  LoadMoreQuestionCovers({this.boundary, this.offset});
  @override
  List<Object> get props => [boundary, offset];
}