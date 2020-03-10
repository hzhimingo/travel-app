part of 'hot_question_bloc.dart';

abstract class HotQuestionState extends Equatable {
  const HotQuestionState();
}

class HotQuestionInitial extends HotQuestionState {
  @override
  List<Object> get props => [];
}
