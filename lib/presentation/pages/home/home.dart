import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
       child: Center(
         child: Text('Home'),
       ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}