import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:travel/entity/question_detail.dart';

class QuestionDetailPanel extends StatelessWidget {
  final QuestionDetail questionDetail;
  final TextStyle _numberStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 17.0,
  );
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );
  QuestionDetailPanel({Key key, this.questionDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            questionDetail.title,
            style: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15.0),
          _buildQuestionContent(questionDetail.content),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildTag('问题'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${questionDetail.visitedNum}',
                    style: _numberStyle,
                  ),
                  Text(
                    '浏览',
                    style: _textStyle,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '·',
                    style: _textStyle,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '${questionDetail.answerNum}',
                    style: _numberStyle,
                  ),
                  Text(
                    '回答',
                    style: _textStyle,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 18.0,
                    backgroundImage: ExtendedNetworkImageProvider(
                      questionDetail.avatar,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    questionDetail.nickname,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              Text(
                '问于 ${questionDetail.date}',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black45,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildTag(String name) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 200.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.grey[300],
        ),
      ),
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 3.0,
        bottom: 3.0,
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }
}

_buildQuestionContent(String content) {
  if (content == null) {
    return Container();
  } else {
    return Container(
      constraints: BoxConstraints(
        minHeight: 20.0,
      ),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 17.0,
        ),
      ),
    );
  }
}
