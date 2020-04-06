import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

import './time_and_option.dart';

class ReplyCard extends StatelessWidget {
  final int commentAuthorId;
  final int replyId;
  final int replyAuthorId;
  final String replyAuthorNickname;
  final String replyAuthorAvatar;
  final int replyAuthorLevel;
  final int replyToId;
  final String replyToNickname;
  final String content;
  final String time;
  final int thumbUpNum;
  final bool isThumbUp;
  const ReplyCard({
    Key key,
    this.commentAuthorId,
    this.replyId,
    this.replyAuthorId,
    this.replyAuthorAvatar,
    this.replyAuthorNickname,
    this.replyAuthorLevel,
    this.replyToId,
    this.replyToNickname,
    this.content,
    this.time,
    this.thumbUpNum,
    this.isThumbUp,
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
                replyAuthorAvatar,
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
                          replyAuthorNickname,
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
                            'LV.$replyAuthorLevel',
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
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Offstage(
                                offstage: commentAuthorId == replyToId,
                                child: Text('回复', style: TextStyle(
                                  fontSize: 15.0,
                                ),),
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Offstage(
                                offstage: commentAuthorId == replyToId,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    '@$replyToNickname:',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: content,
                              style: TextStyle(
                                fontSize: 15.0,
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                    TimeAndOption(
                      time: time,
                      thumbUpNum: thumbUpNum,
                      isThumbUp: isThumbUp,
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
