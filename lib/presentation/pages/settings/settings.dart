import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('退出登录'),
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }
}
