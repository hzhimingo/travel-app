import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/post_moment_form.dart';
import 'package:travel/service/moment_service.dart';

part 'edit_moment_event.dart';
part 'edit_moment_state.dart';

class EditMomentBloc extends Bloc<EditMomentEvent, EditMomentState> {

  final MomentService momentService;

  EditMomentBloc({this.momentService});

  @override
  EditMomentState get initialState => EditMomentEmpty();

  @override
  Stream<EditMomentState> mapEventToState(
    EditMomentEvent event,
  ) async* {
    if (event is SubmitMomentEvent) {
      yield SubmitMomentIng();
      var result = await momentService.addMoment(event.form);
      yield result.fold(
        (failure) => SubmitMomentFailed(),
        (success) => SubmitMomentSuccess(),
      );
    }
  }
}
