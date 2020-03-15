import 'package:flutter/material.dart';

class BottomActionPanel extends StatelessWidget {
  const BottomActionPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 2.0,
            offset: Offset.zero,
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: 30.0,
        right: 30.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add_circle_outline,
                    size: 27.0,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '关注问题(${447})',
                    style: TextStyle(fontSize: 17.0),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.mode_edit,
                    size: 27.0,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '添加回答',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
