import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:travel/presentation/pages/comment_reply/components/reply_cover_pool.dart';

class CommentLine extends StatelessWidget {
  const CommentLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(
          top: 15.0,
          left: 15.0,
          right: 15.0,
        ),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 16.0,
              backgroundImage: ExtendedNetworkImageProvider(
                'https://p1-q.mafengwo.net/s15/M00/96/01/CoUBGV4pHj6AdsKGAADkQCnAbQE62.jpeg',
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 15.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromRGBO(246, 247, 249, 1.0),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '一定',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          padding: EdgeInsets.only(
                            left: 5.0,
                            right: 5.0,
                            top: 1.0,
                            bottom: 1.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.blueAccent,
                          ),
                          child: Text(
                            'LV.4',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        '给摄影师加个鸡腿！这么美的照片以后能不能经常发',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '20小时前',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey[500],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.thumb_up,
                                  size: 17.0,
                                  color: Colors.grey[400],
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  '251',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.comment,
                                  size: 17.0,
                                  color: Colors.grey[500],
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  '37',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    ReplyCoverPool(),
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
