import 'package:flutter/material.dart';
import 'package:travel/presentation/components/user_info_title.dart';

class AnswerContent extends StatelessWidget {
  const AnswerContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Column(
        children: <Widget>[
          UserInfoTitle(
            nickname: "坦克疯子",
            avatar: "https://travel-1257167414.cos.ap-shanghai.myqcloud.com/avatar.jpg",
            dateTime: "2020-02-18",
          ),
        ],
      ),
    );
  }
}
