import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class ReplyPage extends StatelessWidget {
  const ReplyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            GlobalRoute.router.pop(context);
          },
        ),
        title: Text(
          '全部回复',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => ReplyCard(
                commentAuthorId: 1,
                replyId: index,
                replyAuthorAvatar: 'https://n1-q.mafengwo.net/s9/M00/3F/4E/wKgBs12I60KAYUH9AAamUsrNXSk70.jpeg',
                replyAuthorId: index,
                replyAuthorLevel: index,
                replyAuthorNickname: '洪岩涩不是红颜色$index',
                replyToId: index ,
                replyToNickname: '新霁清旸$index',
                content: '非常好啊第三方的第三方的地方',
                isThumbUp: false,
                thumbUpNum: 10,
                time: '刚刚',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
