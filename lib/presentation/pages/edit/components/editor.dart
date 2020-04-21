import 'package:flutter/material.dart';

class Editor extends StatefulWidget {
  Editor({Key key}) : super(key: key);

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  List<Widget> children = List();

  @override
  void initState() {
    super.initState();
    children.add(TextField(
      style: TextStyle(
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
        hintText: '请输入正文',
        hintStyle: TextStyle(fontSize: 19.0, color: Colors.grey[400]),
      ),
      maxLines: null,
      minLines: 1,
      keyboardType: TextInputType.multiline,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children,
    );
  }
}
