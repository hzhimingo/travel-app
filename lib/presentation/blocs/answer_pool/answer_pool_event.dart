part of 'answer_pool_bloc.dart';

abstract class AnswerPoolEvent extends Equatable {
  const AnswerPoolEvent();
}

class InitializeAnswerPool extends AnswerPoolEvent {
  @override
  List<Object> get props => [];
}

class LoadMoreAnswerCovers extends AnswerPoolEvent {
  @override
  List<Object> get props => [];
}