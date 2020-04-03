import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class TravelNoteCoverCard extends StatelessWidget {
  const TravelNoteCoverCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 30.0),
        padding: EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.grey[200],
        ))),
        height: 170.0,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '  阅尽明清六百年，平遥古城脉络图阅尽明清六百年，平遥古城脉络图',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 13.0,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                '们后面是什么',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: ExtendedNetworkImageProvider(
                            'http://p1-q.mafengwo.net/s15/M00/A6/33/CoUBGV5vNiyActl4AEQ3SQOnyiQ901.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            _TravelNoteTag(text: '我要辞职看世界',),
                            _TravelNoteTag(text: '冰岛',),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.new_releases,
                          size: 17.0,
                        ),
                        SizedBox(width: 5.0),
                        Text('2017'),
                        SizedBox(width: 15.0),
                        Icon(
                          Icons.comment,
                          size: 17.0,
                        ),
                        SizedBox(width: 5.0),
                        Text('12'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TravelNoteTag extends StatelessWidget {
  final String text;
  const _TravelNoteTag({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2.0),
      padding: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.grey[200]
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.0,
        ),
      ),
    );
  }
}
