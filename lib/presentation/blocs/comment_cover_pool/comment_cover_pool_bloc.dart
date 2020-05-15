import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/entity/comment_cover.dart';
import 'package:travel/service/cr_service.dart';

part 'comment_cover_pool_event.dart';
part 'comment_cover_pool_state.dart';

class CommentCoverPoolBloc extends Bloc<CommentCoverPoolEvent, CommentCoverPoolState> {

  final CRService crService;

  CommentCoverPoolBloc({this.crService});

  @override
  CommentCoverPoolState get initialState => CommentCoverPoolEmpty();

  @override
  Stream<CommentCoverPoolState> mapEventToState(
    CommentCoverPoolEvent event,
  ) async* {
    final currentState = state;
    if (event is LoadCommentCoverPool) {
      print("GET COMMENT");
      yield CommentCoverPoolLoaded(commentCovers: event.commentCovers.reversed.toList());
    }
    if (event is AddComment) {
      if (currentState is CommentCoverPoolLoaded) {
        CommentCover newComment = CommentCover(
          authorAvatar: event.authorAvatar,
          authorNickname: event.authorNickname,
          time: '刚刚',
          content: event.content,
        );
        var result = await crService.addComment(event.author, event.serviceBusinessId, event.content);
        yield result.fold(
          (failure) => AddCommentFailed(),
          (success) {
            List<CommentCover> newCommentCovers = currentState.commentCovers;
            newCommentCovers.add(newComment);
            return CommentCoverPoolLoaded(commentCovers: newCommentCovers.reversed.toList());
          }
        );
      }
    }
  }
}
