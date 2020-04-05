import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class ReplyCoverPool extends StatelessWidget {
  const ReplyCoverPool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => _ReplyCoverItem(
              replyAuthorId: 1,
              replyNickname: '你好世界',
              replyToId: 2,
              replyToNickname: '牛逼的世界',
              content: '一定要买一套红裙子',
            ),
          ),
          GestureDetector(
            onTap: () {
              GlobalRoute.router.navigateTo(
                context,
                '/reply',
                transition: TransitionType.cupertino,
              );
            },
            child: Text(
              '查看全部回复(10)',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReplyCoverItem extends StatelessWidget {
  final int commentAuthorId;
  final int replyAuthorId;
  final String replyNickname;
  final int replyToId;
  final String replyToNickname;
  final String content;

  const _ReplyCoverItem({
    Key key,
    this.commentAuthorId,
    this.replyAuthorId,
    this.replyNickname,
    this.replyToId,
    this.replyToNickname,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> children = List();
    children.add(WidgetSpan(
      child: GestureDetector(
        onTap: () {},
        child: Text(
          '$replyNickname',
          style: TextStyle(color: Colors.blueAccent, fontSize: 14.0),
        ),
      ),
    ));
    if (replyToId == null) {
      children.add(WidgetSpan(
        child: Text('回复'),
      ));
    } else {
      children.add(WidgetSpan(
        child: Text('回复'),
      ));
      children.add(WidgetSpan(
        child: GestureDetector(
          onTap: () {},
          child: Text(
            '$replyToNickname:',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
      ));
    }
    children.add(TextSpan(
      text: content,
      style: TextStyle(color: Colors.black),
    ));
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
        child: RichText(
          text: TextSpan(
            children: children,
          ),
        ),
      ),
    );
  }
}
