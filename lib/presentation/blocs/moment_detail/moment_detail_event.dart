part of 'moment_detail_bloc.dart';

abstract class MomentDetailEvent extends Equatable {
  const MomentDetailEvent();
}

class FetchMomnetDetail extends MomentDetailEvent {
  final int momentId;
  final int userId;

  FetchMomnetDetail({this.momentId, this.userId});
  @override
  List<Object> get props => [momentId, userId];
}