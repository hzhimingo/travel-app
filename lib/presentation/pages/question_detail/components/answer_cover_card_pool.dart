import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel/presentation/blocs/answer_pool/answer_pool_bloc.dart';
import 'answer_cover_card.dart';

class AnswerCoverCardPool extends StatelessWidget {
  final String question;
  final RefreshController refreshController;

  const AnswerCoverCardPool({Key key, this.refreshController, this.question})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[100],
            width: MediaQuery.of(context).size.width,
            height: 45.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '默认排序',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Icon(Icons.sort),
                    SizedBox(width: 5.0),
                  ],
                ),
              ],
            ),
          ),
          BlocConsumer<AnswerPoolBloc, AnswerPoolState>(
            listener: (context, state) {
              if (state is AnswerPoolLoaded) {
                if (refreshController.isLoading) {
                  refreshController.loadComplete();
                }
              }
              if (state is AnswerPoolLoadFailure) {
                if (refreshController.isLoading) {
                  refreshController.loadFailed();
                }
              }
            },
            buildWhen: (previous, current) {
              if (current is AnswerPoolLoadFailure ||
                  current is AnswerPoolLoading) {
                return false;
              } else {
                return true;
              }
            },
            //ignore: missing_return
            builder: (context, state) {
              if (state is AnswerPoolEmpty || state is AnswerPoolInitializing) {
                return Center(
                  child: Text('Loading....'),
                );
              }
              if (state is AnswerPoolInitializeFailure) {
                return Center(
                  child: Text('Fail.....'),
                );
              }
              if (state is AnswerPoolLoaded) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.answerCovers.length,
                  itemBuilder: (context, index) => AnswerCoverCard(
                    question: question,
                    answerCover: state.answerCovers[index],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
