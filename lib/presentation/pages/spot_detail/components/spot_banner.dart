import 'package:flutter/material.dart';

class SpotBanner extends StatelessWidget {
  const SpotBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 230.0,
      child: ListView(
        padding: EdgeInsets.all(15.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 320.0,
            height: 230.0,
            margin: EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            width: 320.0,
            height: 230.0,
            margin: EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            width: 320.0,
            height: 230.0,
            margin: EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }
}