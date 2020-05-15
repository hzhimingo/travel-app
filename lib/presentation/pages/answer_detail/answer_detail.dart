import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/answer_detail/answer_detail_bloc.dart';
import 'package:travel/presentation/blocs/comment_cover_pool/comment_cover_pool_bloc.dart';
import 'package:travel/presentation/components/comment/comment_cover_pool.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class AnswerDetail extends StatelessWidget {
  const AnswerDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  GlobalRoute.router.pop(context);
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ];
        },
        body: BlocBuilder<AnswerDetailBloc, AnswerDetailState>(
          builder: (context, state) {
            if (state is AnswerDetailEmpty) {
              return Center(
                child: Text('Loading...'),
              );
            }
            if (state is AnswerDetailLoadFail) {
              return Center(
                child: Text('Load Fail....'),
              );
            }
            if (state is AnswerDetailLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    QuestionCoverPanel(
                      questionId: 1,
                      answerNum: 10,
                      title: '这是问题这是问题这是问题这是问题这是问题这是问题00',
                    ),
                    AnswerContent(
                      answerDetailData: state.detail,
                    ),
                    BlocProvider<CommentCoverPoolBloc>(
                      create: (context) =>
                          getIt.get<CommentCoverPoolBloc>()..add(LoadCommentCoverPool(
                            commentCovers: state.detail.comments,
                          )),
                      child: CommentCoverPool(
                        serviceBusinessId: state.detail.answerId,
                        authorNickname: state.detail.nickname,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<AnswerDetailBloc, AnswerDetailState>(
        builder: (context, state) {
          if (state is AnswerDetailLoaded) {
            return BottomActionPanel(
              favNum: state.detail.favNum,
              collectNum: state.detail.starNum,
              commentNum: state.detail.commentNum,
              isCollect: state.detail.isCollect,
              isFav: state.detail.isStar,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
