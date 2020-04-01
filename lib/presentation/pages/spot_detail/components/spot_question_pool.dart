import 'package:flutter/material.dart';

class SpotQuestionPool extends StatelessWidget {
  const SpotQuestionPool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '问答',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '共77条问答',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black38,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18.0,
                    color: Colors.black38,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => _SpotQuestionItem(),
          ),
        ],
      ),
    );
  }
}

class _SpotQuestionItem extends StatelessWidget {
  const _SpotQuestionItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
      ),
      padding: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(246, 247, 249, 1.0),
          ),
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              '问',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '北京野生动物园怎么样，值得一去吗？',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 8.0,
                      ),
                       CircleAvatar(
                        radius: 8.0,
                      ),
                       CircleAvatar(
                        radius: 8.0,
                      ),
                    ],
                  ),
                  SizedBox(width: 5.0),
                  Text('6人回答'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
