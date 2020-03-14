part of 'answer_pool_bloc.dart';

abstract class AnswerPoolState extends Equatable {
  const AnswerPoolState();
}

class AnswerPoolInitializing extends AnswerPoolState {
  @override
  List<Object> get props => [];
}

class AnswerPoolInitializeFailure extends AnswerPoolState {
  @override
  List<Object> get props => [];
}

class AnswerPoolEmpty extends AnswerPoolState {
  @override
  List<Object> get props => [];
}

class AnswerPoolLoading extends AnswerPoolState {
  @override
  List<Object> get props => [];
}

class AnswerPoolLoaded extends AnswerPoolState {
  final List<AnswerCover> answerCovers;

  AnswerPoolLoaded({this.answerCovers});
  @override
  List<Object> get props => [answerCovers];
}

class AnswerPoolLoadFailure extends AnswerPoolState {
  @override
  List<Object> get props => [];
}
