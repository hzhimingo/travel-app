part of 'collect_bloc.dart';

abstract class CollectEvent extends Equatable {
  const CollectEvent();
}

class ActionCollect extends CollectEvent {
  final int typeId;
  final int userId;
  final int serviceBusinessId;

  ActionCollect({this.typeId, this.userId, this.serviceBusinessId});

  @override
  List<Object> get props => [typeId, userId, serviceBusinessId];
}

class CancelCollect extends CollectEvent {

  final int userId;
  final int serviceBusinessId;

  CancelCollect({this.userId, this.serviceBusinessId});

  @override
  List<Object> get props => [userId, serviceBusinessId];

}