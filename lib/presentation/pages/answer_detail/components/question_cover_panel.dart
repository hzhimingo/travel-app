import 'package:flutter/material.dart';

class QuestionCoverPanel extends StatelessWidget {
  const QuestionCoverPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey[100],
          ),
          bottom: BorderSide(
            color: Colors.grey[100],
          ),
        ),
      ),
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 25.0,
        bottom: 25.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '南昌当地人都喜欢去哪吃当地最地道的美食？',
            style: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '查看其他35回答',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    color: Colors.blueAccent,
                  ),
                  Text(
                    '写回答',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16.0,
                    ),
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
