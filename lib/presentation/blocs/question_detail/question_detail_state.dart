part of 'question_detail_bloc.dart';

abstract class QuestionDetailState extends Equatable {
  const QuestionDetailState();
}

class QuestionDetailEmpty extends QuestionDetailState {
  @override
  List<Object> get props => [];
}

class QuestionDetailLoading extends QuestionDetailState {
  @override
  List<Object> get props => [];
}

class QuestionDetailLoaded extends QuestionDetailState {
  final QuestionDetail questionDetail;

  QuestionDetailLoaded({this.questionDetail});
  
  @override
  List<Object> get props => [questionDetail];
}

class QuestionDetailLoadFailure extends QuestionDetailState {
  @override
  List<Object> get props => [];
}


