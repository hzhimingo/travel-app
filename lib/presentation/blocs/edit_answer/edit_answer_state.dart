part of 'edit_answer_bloc.dart';

abstract class EditAnswerState extends Equatable {
  const EditAnswerState();
}

class EditAnswerEmpty extends EditAnswerState {
  @override
  List<Object> get props => [];
}

class SubmitAnswerFailed extends EditAnswerState {
  @override
  List<Object> get props => [];
}

class SubmitAnswerSuccess extends EditAnswerState {
  @override
  List<Object> get props => [];
}

class SubmitAnswerIng extends EditAnswerState {
  @override
  List<Object> get props => [];
}
