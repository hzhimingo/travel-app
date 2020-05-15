part of 'comment_cover_pool_bloc.dart';

abstract class CommentCoverPoolEvent extends Equatable {
  const CommentCoverPoolEvent();
}

class LoadCommentCoverPool extends CommentCoverPoolEvent {
  final int userId;
  final int serviceBusinessId;
  final List<CommentCover> commentCovers;

  LoadCommentCoverPool({this.commentCovers, this.serviceBusinessId, this.userId});

  @override
  List<Object> get props => [userId, serviceBusinessId, commentCovers];
}

class AddComment extends CommentCoverPoolEvent {
  final int serviceBusinessId;
  final String content;
  final String authorNickname;
  final int author;
  final String authorAvatar;

  AddComment({
    this.serviceBusinessId,
    this.content,
    this.author,
    this.authorNickname,
    this.authorAvatar,
  });

  @override
  List<Object> get props => [serviceBusinessId, content, author, authorNickname, authorAvatar];
}
