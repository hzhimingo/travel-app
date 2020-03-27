import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: RaisedButton(
        child: Text('GO'),
        onPressed: () {
          GlobalRoute.router.navigateTo(context, '/spotPool');
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
