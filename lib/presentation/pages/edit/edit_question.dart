import 'package:flutter/material.dart';

class EditQuestion extends StatefulWidget {
  EditQuestion({Key key}) : super(key: key);

  @override
  _EditQuestionState createState() => _EditQuestionState();
}

class _EditQuestionState extends State<EditQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {},
        ),
        actions: <Widget>[
          Text('发表问题'),
        ],
      ),
    );
  }
}
