import 'package:flutter/material.dart';
import 'package:travel/presentation/pages/comment_reply/components/comment_line.dart';
import 'package:travel/route/routes.dart';

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
          onPressed: (){
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
        itemBuilder: (context, index) => CommentLine(),
      ),
    );
  }
}
