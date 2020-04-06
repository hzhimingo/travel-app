import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            GlobalRoute.router.pop(context);
          },
        ),
        title: Text(
          '全部评论(10)',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => CommentCard(
          commentId: 1,
          commentAuthorNickname: '一定',
          commentAuthorAvatar: 'https://n1-q.mafengwo.net/s10/M00/9D/31/wKgBZ1z36uiAMNU8AAbNDRuF72A49.jpeg',
          commentAuthorId: 1,
          content: '一定要买一条红裙子去拍照看过的反馈给',
          isThumbUp: false,
          thumbUpNum: 147,
          commentAuthorLevel: 6,
          commentNum: 10,
          time: '20小时前',
        ),
      ),
    );
  }
}
