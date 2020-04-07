import 'package:flutter/material.dart';

class MessageCenter extends StatefulWidget {
  MessageCenter({Key key}) : super(key: key);

  @override
  _MessageCenterState createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MessageCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text('消息中心'),
        actions: <Widget>[
          FlatButton(
            onPressed: (){},
            child: Text('全部已读'),
          ),
        ],
      ),
    );
  }
}
