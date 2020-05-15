part of 'answer_detail_bloc.dart';

abstract class AnswerDetailState extends Equatable {
  const AnswerDetailState();
}

class AnswerDetailEmpty extends AnswerDetailState {
  @override
  List<Object> get props => [];
}

class AnswerDetailLoaded extends AnswerDetailState {
  final AnswerDetailData detail;

  AnswerDetailLoaded({this.detail});

  @override
  List<Object> get props => [detail];
}

class AnswerDetailLoadFail extends AnswerDetailState {
  @override
  List<Object> get props => [];
}
