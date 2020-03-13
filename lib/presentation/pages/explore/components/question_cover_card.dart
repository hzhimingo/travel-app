import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:travel/route/routes.dart';

class QuestionCoverCard extends StatelessWidget {
  const QuestionCoverCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GlobalRoute.router.navigateTo(context, '/questionDetail');
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0),
        margin: EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[200],
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                '泾县的桃花潭和太平湖二选一，怎么办？',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 40.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 15.0,
                    backgroundImage: ExtendedNetworkImageProvider(
                      'https://travel-1257167414.cos.ap-shanghai.myqcloud.com/avatar.jpg',
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '小omama',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '的回答',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            _buildContent(true),
            Container(
              width: double.infinity,
              height: 30.0,
              //color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        _tag('泾县'),
                        _tag('目的地推荐'),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        _numberAndText(3915, '浏览'),
                        SizedBox(width: 6.0),
                        _numberAndText(6, '回答'),
                        SizedBox(width: 6.0),
                        _numberAndText(8, '赞'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _numberAndText(int number, String text) {
    return Row(
      children: <Widget>[
        Text(
          '$number',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        SizedBox(width: 3.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }

  _tag(String text) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 90.0,
      ),
      margin: EdgeInsets.only(left: 2.0, right: 2.0),
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.black38,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _buildContent(bool hasImage) {
    int imageLength = 4;
    if (hasImage) {
      if (imageLength <= 2) {
        return _buildContentHasImageLessThanTwo();
      } else {
        return _buildContentHasImageMoreThanThree();
      }
    } else {
      return _buildContentWithoutImage();
    }
  }

  _buildContentHasImageLessThanTwo() {
    return Container(
      height: 110.0,
      margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
      padding: EdgeInsets.only(left: 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 110.0,
              margin: EdgeInsets.only(right: 10.0),
              child: Text(
                '嗯，二选一的话，我建议桃花潭，其实这两个地方都可以去的，一天之内....太平湖很大，有一侧离桃花潭非常近哦，大约6公里左右的路程，你如果上午去桃花有一侧离桃花潭非常近哦，大约6公里左右的路程，你如果上午去桃花有一侧离桃花潭非常近哦，大约6公里左右的路程，你如果上午去桃花',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          ExtendedImage.network(
            'https://p1-q.mafengwo.net/s15/M00/1F/92/CoUBGV5CEcKARp2TAAHCIyRVBQc06.jpeg?imageMogr2%2Fthumbnail%2F%21600x600r%2Fstrip%2Fquality%2F90',
            cache: true,
            width: 150.0,
            height: 110.0,
            fit: BoxFit.cover,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ],
      ),
    );
  }

  _buildContentHasImageMoreThanThree() {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
      padding: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            margin: EdgeInsets.only(bottom: 5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ExtendedImage.network(
                    'https://p1-q.mafengwo.net/s15/M00/1F/92/CoUBGV5CEcKARp2TAAHCIyRVBQc06.jpeg?imageMogr2%2Fthumbnail%2F%21600x600r%2Fstrip%2Fquality%2F90',
                    cache: true,
                    height: 120.0,
                    fit: BoxFit.cover,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.0, right: 3.0),
                    child: ExtendedImage.network(
                      'https://p1-q.mafengwo.net/s15/M00/1F/92/CoUBGV5CEcKARp2TAAHCIyRVBQc06.jpeg?imageMogr2%2Fthumbnail%2F%21600x600r%2Fstrip%2Fquality%2F90',
                      cache: true,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: ExtendedImage.network(
                    'https://p1-q.mafengwo.net/s15/M00/1F/92/CoUBGV5CEcKARp2TAAHCIyRVBQc06.jpeg?imageMogr2%2Fthumbnail%2F%21600x600r%2Fstrip%2Fquality%2F90',
                    cache: true,
                    height: 120.0,
                    fit: BoxFit.cover,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildContentWithoutImage()
        ],
      ),
    );
  }

  _buildContentWithoutImage() {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Text(
        '嗯，二选一的话，我建议桃花潭，其实这两个地方都可以去的，一天之内....太平湖很大，有一侧离桃花潭非常近哦，大约6公里左右的路程，你如果上午去桃花',
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black54,
        ),
      ),
    );
  }
}
