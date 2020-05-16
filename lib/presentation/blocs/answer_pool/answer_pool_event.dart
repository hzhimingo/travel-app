part of 'answer_pool_bloc.dart';

abstract class AnswerPoolEvent extends Equatable {
  const AnswerPoolEvent();
}

class InitializeAnswerPool extends AnswerPoolEvent {

  final int questionId;
  final int userId;

  InitializeAnswerPool({this.questionId, this.userId});

  @override
  List<Object> get props => [questionId, userId];
}

class LoadMoreAnswerCovers extends AnswerPoolEvent {

  final int questionId;
  final int userId;

  LoadMoreAnswerCovers({this.questionId, this.userId});

  @override
  List<Object> get props => [questionId];
}