part of 'question_pool_bloc.dart';

abstract class QuestionPoolState extends Equatable {
  const QuestionPoolState();
}

class QuestionPoolInitializing extends QuestionPoolState {
  @override
  List<Object> get props => [];
}

class QuestionPoolInitializeFailure extends QuestionPoolState {
  @override
  List<Object> get props => [];
}

class QuestionPoolEmpty extends QuestionPoolState {
  @override
  List<Object> get props => [];
}

class QuestionPoolLoading extends QuestionPoolState {
  @override
  List<Object> get props => [];
}

class QuestionPoolLoaded extends QuestionPoolState {
  final List<QuestionCover> questionCovers;

  QuestionPoolLoaded({this.questionCovers});
  @override
  List<Object> get props => [questionCovers];
}

class QuestionPoolLoadFailure extends QuestionPoolState {
  @override
  List<Object> get props => [];
}
