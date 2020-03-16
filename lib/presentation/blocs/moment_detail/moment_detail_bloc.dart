import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/moment_detail.dart';
import 'package:travel/service/moment_service.dart';

part 'moment_detail_event.dart';
part 'moment_detail_state.dart';

class MomentDetailBloc extends Bloc<MomentDetailEvent, MomentDetailState> {
  
  final MomentService momentService;

  MomentDetailBloc({this.momentService});

  @override
  MomentDetailState get initialState => MomentDetailEmpty();

  @override
  Stream<MomentDetailState> mapEventToState(
    MomentDetailEvent event,
  ) async* {
    if (event is FetchMomnetDetail) {
      var data = await momentService.fetchMomentDetail(event.momentId);
      yield data.fold(
        (failure) => MomentDetailFaliure(),
        (momentDetail) => MomentDetailLoaded(momentDetail: momentDetail),
      );
    }
  }
}
