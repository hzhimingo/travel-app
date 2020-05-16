part of 'edit_question_bloc.dart';

abstract class EditQuestionState extends Equatable {
  const EditQuestionState();
}

class EditQuestionEmpty extends EditQuestionState {
  @override
  List<Object> get props => [];
}

class SubmitQuestionFailed extends EditQuestionState {
  @override
  List<Object> get props => [];
}

class SubmitQuestionIng extends EditQuestionState {
  @override
  List<Object> get props => [];
}

class SubmitQuestionSuccess extends EditQuestionState {
  @override
  List<Object> get props => [];
}
