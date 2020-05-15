part of 'thumbup_bloc.dart';

abstract class ThumbupState extends Equatable {
  const ThumbupState();
}

class UnThumbup extends ThumbupState {
  @override
  List<Object> get props => [];
}

class Thumbuped extends ThumbupState {
  @override
  List<Object> get props => [];
}

class ThumbUpFailed extends ThumbupState {
  @override
  List<Object> get props => [];
}

class CancelThumbUpFailed extends ThumbupState {
  @override
  List<Object> get props => [];
}


