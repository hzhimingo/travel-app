import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

import './time_and_option.dart';
import './reply_cover_pool.dart';

class CommentCard extends StatelessWidget {
  final int commentId;
  final int commentAuthorId;
  final String commentAuthorNickname;
  final String commentAuthorAvatar;
  final int commentAuthorLevel;
  final String content;
  final String time;
  final int thumbUpNum;
  final bool isThumbUp;
  final int commentNum;

  const CommentCard({
    Key key,
    this.commentId,
    this.commentAuthorId,
    this.commentAuthorNickname,
    this.commentAuthorLevel,
    this.content,
    this.thumbUpNum,
    this.time,
    this.isThumbUp,
    this.commentNum,
    this.commentAuthorAvatar,
  }) : super(key: key);

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
                commentAuthorAvatar,
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
                          commentAuthorNickname,
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
                            'LV.$commentAuthorLevel',
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
                        content,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    TimeAndOption(
                      time: time,
                      thumbUpNum: thumbUpNum,
                      commentNum: commentNum,
                      isThumbUp: isThumbUp,
                    ),
                    _buildReplyCoverPool(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildReplyCoverPool() {
    return ReplyCoverPool();
  }
}
