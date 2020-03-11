part of 'moment_detail_bloc.dart';

abstract class MomentDetailEvent extends Equatable {
  const MomentDetailEvent();
}

class FetchMomnetDetail extends MomentDetailEvent {
  final int momentId;

  FetchMomnetDetail({this.momentId});
  @override
  List<Object> get props => [momentId];
}