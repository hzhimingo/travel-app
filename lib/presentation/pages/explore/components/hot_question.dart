import 'package:flutter/material.dart';
import 'scroll_question_card.dart';

class HotQuestion extends StatefulWidget {
  HotQuestion({Key key}) : super(key: key);

  @override
  _HotQuestionState createState() => _HotQuestionState();
}

class _HotQuestionState extends State<HotQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250.0,
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '热门讨论',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        '更多热议',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 190.0,
            margin: EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0,),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => ScrollQuestionCard(),
            ),
          ),
        ],
      ),
    );
  }
}