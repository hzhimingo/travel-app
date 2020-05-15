import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reply_pool_event.dart';
part 'reply_pool_state.dart';

class ReplyPoolBloc extends Bloc<ReplyPoolEvent, ReplyPoolState> {
  @override
  ReplyPoolState get initialState => ReplyPoolInitial();

  @override
  Stream<ReplyPoolState> mapEventToState(
    ReplyPoolEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
