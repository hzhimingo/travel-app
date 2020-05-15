part of 'comment_cover_pool_bloc.dart';

abstract class CommentCoverPoolState extends Equatable {
  const CommentCoverPoolState();
}

class CommentCoverPoolEmpty extends CommentCoverPoolState {
  @override
  List<Object> get props => [];
}

class CommentCoverPoolLoaded extends CommentCoverPoolState {
  final List<CommentCover> commentCovers;

  CommentCoverPoolLoaded({this.commentCovers});

  @override
  List<Object> get props => [commentCovers];
}

class AddCommentFailed extends CommentCoverPoolState {
  @override
  List<Object> get props => [];
}
