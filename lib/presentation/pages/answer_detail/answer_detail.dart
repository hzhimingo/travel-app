import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class AnswerDetail extends StatelessWidget {
  const AnswerDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
                onPressed: () {
                  GlobalRoute.router.pop(context);
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.black,),
                  onPressed: () {},
                ),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              QuestionCoverPanel(),
              AnswerContent(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomActionPanel(),
    );
  }
}
