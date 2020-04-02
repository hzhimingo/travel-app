import 'package:flutter/material.dart';

class HotTravelNotePool extends StatelessWidget {
  const HotTravelNotePool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '精选游记',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '更多',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black38,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 19.0,
                    color: Colors.black38,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
