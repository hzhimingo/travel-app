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
  final Page<List<QuestionCover>> page;

  QuestionPoolLoaded({this.page});
  @override
  List<Object> get props => [page];
}

class QuestionPoolLoadFailure extends QuestionPoolState {
  @override
  List<Object> get props => [];
}
