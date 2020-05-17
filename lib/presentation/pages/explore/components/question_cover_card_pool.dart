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

class _QuestionPoolState extends State<QuestionPool>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          if (current is QuestionPoolLoadFailure ||
              current is QuestionPoolLoading) {
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
              onLoading: () {
                if (state.page.hasNext) {
                  context.bloc<QuestionPoolBloc>().add(LoadMoreQuestionCovers(
                      boundary: state.page.boundary + state.page.offset,
                      offset: state.page.offset));
                } else {
                  context.bloc<QuestionPoolBloc>().add(RefreshQuestionCovers(
                        boundary: 0,
                        offset: state.page.offset,
                      ));
                }
              },
              footer: ClassicFooter(),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.page.data.length,
                itemBuilder: (context, index) => QuestionCoverCard(
                  questionCover: state.page.data[index],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
