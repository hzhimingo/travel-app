import 'package:flutter/material.dart';
import 'package:travel/entity/answer_detail.dart';
import 'package:travel/presentation/components/user_info_title.dart';

class AnswerContent extends StatelessWidget {
  final AnswerDetailData answerDetailData;
  const AnswerContent({Key key, this.answerDetailData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserInfoTitle(
            nickname: answerDetailData.nickname,
            avatar: answerDetailData.avatar,
            dateTime: answerDetailData.date,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              left: 5.0,
              right: 5.0,
            ),
            child: Text(
              answerDetailData.content,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
