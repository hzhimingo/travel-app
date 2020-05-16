part of 'edit_moment_bloc.dart';

abstract class EditMomentState extends Equatable {
  const EditMomentState();
}

class EditMomentEmpty extends EditMomentState {
  @override
  List<Object> get props => [];
}

class SubmitMomentFailed extends EditMomentState {
  @override
  List<Object> get props => [];
}

class SubmitMomentSuccess extends EditMomentState {
  @override
  List<Object> get props => [];
}

class SubmitMomentIng extends EditMomentState {
  @override
  List<Object> get props => [];
}
