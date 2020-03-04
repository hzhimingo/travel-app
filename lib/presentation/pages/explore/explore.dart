import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  Explore({Key key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
       child: Center(
         child: Text('Explore'),
       ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}