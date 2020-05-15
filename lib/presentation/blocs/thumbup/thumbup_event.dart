part of 'thumbup_bloc.dart';

abstract class ThumbupEvent extends Equatable {
  const ThumbupEvent();
}

class Thumbup extends ThumbupEvent {

  final int serviceBusinessId;
  final int userId;

  Thumbup({this.serviceBusinessId, this.userId});

  @override
  List<Object> get props => [serviceBusinessId, userId];
}

class CancelThumbUp extends ThumbupEvent {

  final int serviceBusinessId;
  final int userId;

  CancelThumbUp({this.serviceBusinessId, this.userId});

  @override
  List<Object> get props => [serviceBusinessId, userId];

}
