import 'package:flutter/material.dart';

class ApiInfoPanel extends StatelessWidget {
  final bool active;
  const ApiInfoPanel({Key key, this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 10.0,
        bottom: 10.0,
      ),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: active ? Colors.blueAccent : Colors.white,
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100],
              blurRadius: 3.0,
              spreadRadius: 3.0,
              offset: Offset.zero,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.only(right: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Text('类型: Mock'),
                  ],
                ),
                Text('API版本: 1.0'),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0),
              child: Text('主机：127.0.0.1'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0),
              child: Text('前缀：/api/travel/v1'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0),
              child: Text(
                  '请求地址：http://127.0.0.1/api/travel/v1dahflsdfhalsdfhlasdjfhalsdjkfhalskjfjghfjgfjg'),
            ),
          ],
        ),
      ),
    );
  }
}
