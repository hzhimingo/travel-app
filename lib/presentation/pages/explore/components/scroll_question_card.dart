import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

///滚动的单个问题卡片
class ScrollQuestionCard extends StatelessWidget {
  const ScrollQuestionCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        margin: EdgeInsets.only(right: 8.0),
        width: 280.0,
        height: 180.0,
        child: Card(
          elevation: 6.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 80.0,
                height: 30.0,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(255, 84, 137, 1.0),
                      Color.fromRGBO(255, 141, 16, 1.0)
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Text(
                  '热门讨论',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 70.0,
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Text(
                  '抢钱模式？上海迪士尼涨到699元！',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 139.0,
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 17.0,
                            backgroundImage: ExtendedNetworkImageProvider(
                                'https://travel-1257167414.cos.ap-shanghai.myqcloud.com/avatar.jpg'),
                          ),
                          SizedBox(width: 5.0),
                          Container(
                            width: 100.0,
                            child: Text(
                              'HelloWorlddsssd',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '100',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                          TextSpan(
                            text: ' 回答',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 13.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}