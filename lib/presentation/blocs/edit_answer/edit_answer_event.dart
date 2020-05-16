part of 'edit_answer_bloc.dart';

abstract class EditAnswerEvent extends Equatable {
  const EditAnswerEvent();
}

class SubmitAnswer extends EditAnswerEvent {
  final int userId;
  final String content;
  final int question;
  final List<MultipartFile> pics;

  SubmitAnswer({this.userId, this.content, this.question, this.pics});

  @override
  List<Object> get props => [userId, content, question, pics];
}
