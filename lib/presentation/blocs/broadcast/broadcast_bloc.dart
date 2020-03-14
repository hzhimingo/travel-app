import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'broadcast_event.dart';
part 'broadcast_state.dart';

class BroadcastBloc extends Bloc<BroadcastEvent, BroadcastState> {
  @override
  BroadcastState get initialState => BroadcastInitial();

  @override
  Stream<BroadcastState> mapEventToState(
    BroadcastEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
