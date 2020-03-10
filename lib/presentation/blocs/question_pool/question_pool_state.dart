part of 'question_pool_bloc.dart';

abstract class QuestionPoolState extends Equatable {
  const QuestionPoolState();
}

class QuestionPoolInitial extends QuestionPoolState {
  @override
  List<Object> get props => [];
}
