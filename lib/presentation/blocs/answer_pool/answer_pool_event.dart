part of 'answer_pool_bloc.dart';

abstract class AnswerPoolEvent extends Equatable {
  const AnswerPoolEvent();
}

class InitializeAnswerPool extends AnswerPoolEvent {

  final int questionId;

  InitializeAnswerPool({this.questionId});

  @override
  List<Object> get props => [questionId];
}

class LoadMoreAnswerCovers extends AnswerPoolEvent {

  final int questionId;

  LoadMoreAnswerCovers({this.questionId});

  @override
  List<Object> get props => [questionId];
}