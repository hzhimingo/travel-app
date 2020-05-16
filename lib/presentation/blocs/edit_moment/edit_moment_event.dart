part of 'edit_moment_bloc.dart';

abstract class EditMomentEvent extends Equatable {
  const EditMomentEvent();
}

class SubmitMomentEvent extends EditMomentEvent {
  final PostMomentForm form;

  SubmitMomentEvent({this.form});

  @override
  List<Object> get props => [form];
}
