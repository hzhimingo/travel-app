import 'package:flutter/material.dart';

class SpotInfo extends StatelessWidget {
  const SpotInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 15.0,
        right: 15.0,
        left: 15.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '故宫',
                style: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "4.7",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "分",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "/5分",
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                ]),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'The Palace Museum',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(255, 219, 37, 1.0),
                    size: 16.0,
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(255, 219, 37, 1.0),
                    size: 16.0,
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(255, 219, 37, 1.0),
                    size: 16.0,
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(255, 219, 37, 1.0),
                    size: 16.0,
                  ),
                  Icon(
                    Icons.star_half,
                    color: Color.fromRGBO(255, 219, 37, 1.0),
                    size: 16.0,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '世界五大宫之首',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color.fromRGBO(187, 128, 41, 1.0),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '2.3万条',
                    style: TextStyle(
                      color: Color.fromRGBO(187, 128, 41, 1.0),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15.0,
                    color: Color.fromRGBO(187, 128, 41, 1.0),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.only(
              top: 15.0,
              bottom: 15.0,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[100],
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.schedule,
                      color: Colors.black12,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      '07:00-17:00',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '实用信息',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15.0,
                      color: Colors.black45,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 15.0,
              bottom: 15.0,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[100],
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.black12,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      '北京市海淀区新建宫门路19号',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15.0,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
