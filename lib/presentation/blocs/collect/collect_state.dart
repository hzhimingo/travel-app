part of 'collect_bloc.dart';

abstract class CollectState extends Equatable {
  const CollectState();
}

class UnCollect extends CollectState {
  @override
  List<Object> get props => [];
}

class Collected extends CollectState {
  @override
  List<Object> get props => [];
}

class CollectFailed extends CollectState {
  @override
  List<Object> get props => [];
}

class CancelCollectFailed extends CollectState {
  @override
  List<Object> get props => [];
}
