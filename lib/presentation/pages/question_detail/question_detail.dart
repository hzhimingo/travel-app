import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel/presentation/blocs/answer_pool/answer_pool_bloc.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class QuestionDetail extends StatefulWidget {
  QuestionDetail({Key key}) : super(key: key);

  @override
  _QuestionDetailState createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  AnswerPoolBloc _answerPoolBloc;

  @override
  void initState() { 
    super.initState();
    _answerPoolBloc = BlocProvider.of<AnswerPoolBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 247, 249, 1.0),
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
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
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: false,
        enablePullUp: true,
        footer: ClassicFooter(),
        onLoading: () => _answerPoolBloc.add(LoadMoreAnswerCovers()),
        child: ListView(
          children: <Widget>[
            QuestionDetailPanel(),
            BlocConsumer<AnswerPoolBloc, AnswerPoolState>(
              listener: (context, state) {
                if (state is AnswerPoolLoaded) {
                  if (_refreshController.isLoading) {
                    _refreshController.loadComplete();
                  }
                }
                if (state is AnswerPoolLoadFailure) {
                  if (_refreshController.isLoading) {
                    _refreshController.loadFailed();
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
              builder: (context, state) {
                if (state is AnswerPoolEmpty ||
                    state is AnswerPoolInitializing) {
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
                  print(state.answerCovers.length);
                  return AnswerCoverCardPool(
                    answerCovers: state.answerCovers,
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 8.0,
              spreadRadius: 6.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        padding: EdgeInsets.only(
          left: 30.0,
          right: 30.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_circle_outline,
                      size: 27.0,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      '关注问题(${447})',
                      style: TextStyle(fontSize: 17.0),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.mode_edit,
                      size: 27.0,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      '添加回答',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
