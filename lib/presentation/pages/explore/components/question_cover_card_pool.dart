import 'package:flutter/material.dart';
import '../components/question_cover_card.dart';

//问题列表
class QuestionPool extends StatefulWidget {
  QuestionPool({Key key}) : super(key: key);

  @override
  _QuestionPoolState createState() => _QuestionPoolState();
}

class _QuestionPoolState extends State<QuestionPool> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.0),
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          QuestionCoverCard(),
          QuestionCoverCard(),
          QuestionCoverCard(),
        ],
      ),
    );
  }
}