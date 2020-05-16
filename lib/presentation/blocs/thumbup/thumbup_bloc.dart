import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/service/thumbup_service.dart';

part 'thumbup_event.dart';
part 'thumbup_state.dart';

class ThumbupBloc extends Bloc<ThumbupEvent, ThumbupState> {

  final ThumbUpService thumbUpService;

  ThumbupBloc({this.thumbUpService});

  @override
  ThumbupState get initialState => UnThumbup();

  @override
  Stream<ThumbupState> mapEventToState(
    ThumbupEvent event,
  ) async* {
    if (event is Thumbup) {
      print('进行点赞');
      var result = await thumbUpService.thumbUp(event.userId, event.serviceBusinessId);
      yield result.fold(
        (failure) => ThumbUpFailed(),
        (success) => Thumbuped()
      );
    }
    if (event is CancelThumbUp) {
      print('进行取消点赞');
      var result = await thumbUpService.cancelThumbUp(event.userId, event.serviceBusinessId);
      yield result.fold(
        (failure) => CancelThumbUpFailed(),
        (success) => UnThumbup()
      );
    }
  }
}
