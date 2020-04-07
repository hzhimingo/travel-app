import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key key}) : super(key: key);

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
        centerTitle: true,
        title: Text(
          '点赞',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
