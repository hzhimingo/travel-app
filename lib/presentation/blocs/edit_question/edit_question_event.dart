part of 'edit_question_bloc.dart';

abstract class EditQuestionEvent extends Equatable {
  const EditQuestionEvent();
}

class SubmitQuestion extends EditQuestionEvent {
  final int userId;
  final String title;
  final String content;

  SubmitQuestion({this.userId, this.title, this.content});

  @override
  List<Object> get props => [userId, title, content];
}
