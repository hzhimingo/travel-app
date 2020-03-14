part of 'question_pool_bloc.dart';

abstract class QuestionPoolEvent extends Equatable {
  const QuestionPoolEvent();
}

class InitializeQuestionPool extends QuestionPoolEvent {
  @override
  List<Object> get props => [];
}

class LoadMoreQuestionCovers extends QuestionPoolEvent {
  @override
  List<Object> get props => [];
}