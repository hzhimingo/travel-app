import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel/presentation/blocs/question_pool/question_pool_bloc.dart';
import '../components/question_cover_card.dart';

//问题列表
class QuestionPool extends StatefulWidget {
  QuestionPool({Key key}) : super(key: key);

  @override
  _QuestionPoolState createState() => _QuestionPoolState();
}

class _QuestionPoolState extends State<QuestionPool> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.0),
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: BlocConsumer<QuestionPoolBloc, QuestionPoolState>(
        listener: (context, state) {
          if (state is QuestionPoolLoaded) {
          if (_refreshController.isLoading) {
            _refreshController.loadComplete();
          }
        }
        if (state is QuestionPoolLoadFailure) {
          if (_refreshController.isLoading) {
            _refreshController.loadFailed();
          }
        }
        },
        buildWhen: (previous, current) {
          if (current is QuestionPoolLoadFailure || current is QuestionPoolLoading) {
            return false;
          } else {
            return true;
          }
        },
        //ignore: missing_return
        builder: (context, state) {
          if (state is QuestionPoolInitializeFailure) {
            return Center(
              child: Text('Fail'),
            );
          }
          if (state is QuestionPoolEmpty || state is QuestionPoolInitializing) {
            return Center(
              child: Text('Loading'),
            );
          }
          if (state is QuestionPoolLoaded) {
            return SmartRefresher(
              controller: _refreshController,
              enablePullDown: false,
              enablePullUp: true,
              onLoading: () => context.bloc<QuestionPoolBloc>().add(LoadMoreQuestionCovers()),
              footer: ClassicFooter(),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.questionCovers.length,
                itemBuilder: (context, index) => QuestionCoverCard(
                  questionCover: state.questionCovers[index],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
