import 'package:flutter/material.dart';

class Stroke extends StatefulWidget {
  Stroke({Key key}) : super(key: key);

  @override
  _StrokeState createState() => _StrokeState();
}

class _StrokeState extends State<Stroke> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
       child: Center(
         child: Text('Stroke'),
       ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}