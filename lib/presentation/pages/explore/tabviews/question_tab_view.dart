import 'package:flutter/material.dart';

import '../components/components.dart';

class QuestionTabView extends StatefulWidget {
  QuestionTabView({Key key}) : super(key: key);

  @override
  _QuestionTabViewState createState() => _QuestionTabViewState();
}

class _QuestionTabViewState extends State<QuestionTabView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          HotQuestion(),
          QuestionPool(),
        ],
      ),
    );
  }
}