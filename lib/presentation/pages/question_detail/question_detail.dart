import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class QuestionDetail extends StatefulWidget {
  QuestionDetail({Key key}) : super(key: key);

  @override
  _QuestionDetailState createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        child: ListView(
          children: <Widget>[
            QuestionDetailPanel(),
            AnswerCoverCardPool(),
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
