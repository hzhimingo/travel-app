part of 'broadcast_bloc.dart';

abstract class BroadcastState extends Equatable {
  const BroadcastState();
}

class BroadcastInitial extends BroadcastState {
  @override
  List<Object> get props => [];
}
