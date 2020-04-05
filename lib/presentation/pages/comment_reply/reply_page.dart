import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

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
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
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
    );
  }
}
