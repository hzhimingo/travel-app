import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/comment_cover_pool/comment_cover_pool_bloc.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/presentation/components/comment/add_comment_line.dart';
import 'package:travel/presentation/components/comment/comment_cover_line.dart';
import 'package:travel/route/routes.dart';

class CommentCoverPool extends StatelessWidget {
  final int serviceBusinessId;
  final String authorNickname;
  const CommentCoverPool({Key key, this.serviceBusinessId, this.authorNickname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("serivceBusinessId: $serviceBusinessId");
    final CurrentUserBloc _currentUser =
        BlocProvider.of<CurrentUserBloc>(context);
    return BlocConsumer<CommentCoverPoolBloc, CommentCoverPoolState>(
      builder: (context, state) {
        if (state is CommentCoverPoolEmpty) {
          return AddCommentLine(
            commentTo: authorNickname,
            onSend: (value) {
              final currentState = _currentUser.state;
              if (currentState is CurrentUserLoaded) {
                print(currentState.currentUser.userId);
                context.bloc<CommentCoverPoolBloc>()
                  ..add(AddComment(
                    author: currentState.currentUser.userId,
                    authorNickname: currentState.currentUser.nickname,
                    authorAvatar: currentState.currentUser.avatar,
                    serviceBusinessId: serviceBusinessId,
                    content: value,
                  ));
              }
            },
          );
        }
        if (state is CommentCoverPoolLoaded) {
          print(state.commentCovers.length);
          return Container(
            child: Column(
              children: <Widget>[
                AddCommentLine(
                  commentTo: authorNickname,
                  onSend: (value) {
                    final currentState = _currentUser.state;
                    if (currentState is CurrentUserLoaded) {
                      print(currentState.currentUser.userId);
                      context.bloc<CommentCoverPoolBloc>()
                        ..add(
                          AddComment(
                            author: currentState.currentUser.userId,
                            authorNickname: currentState.currentUser.nickname,
                            authorAvatar: currentState.currentUser.avatar,
                            serviceBusinessId: serviceBusinessId,
                            content: value,
                          ),
                        );
                    }
                  },
                ),
                ListView.builder(
                  itemCount: state.commentCovers.length <= 3
                      ? state.commentCovers.length
                      : 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => CommentCoverLine(
                    commentCover: state.commentCovers[index],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    GlobalRoute.router.navigateTo(
                      context,
                      '/comment',
                      transition: TransitionType.cupertino,
                    );
                  },
                  child: Offstage(
                    offstage: state.commentCovers.length <= 3,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      alignment: Alignment.center,
                      height: 50.0,
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                          color: Colors.grey[200],
                        )),
                      ),
                      child: Center(
                        child: Text(
                          '查看${state.commentCovers.length}条评论',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
      buildWhen: (prevoius, current) {
        if (current is AddCommentFailed) {
          return false;
        } else {
          return true;
        }
      },
      listener: (context, state) {},
    );
  }
}
