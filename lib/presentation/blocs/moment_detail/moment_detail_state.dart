part of 'moment_detail_bloc.dart';

abstract class MomentDetailState extends Equatable {
  const MomentDetailState();
}

class MomentDetailEmpty extends MomentDetailState {
  @override
  List<Object> get props => [];
}

class MomentDetailLoaded extends MomentDetailState {
  final MomentDetail momentDetail;

  MomentDetailLoaded({this.momentDetail});
  @override
  List<Object> get props => [momentDetail];
}

class MomentDetailFaliure extends MomentDetailState {
  @override
  List<Object> get props => [];
}