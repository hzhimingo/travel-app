import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:travel/entity/picture.dart';

class AnswerCoverCard extends StatelessWidget {
  final List<Picture> pictures = [
    Picture(
      pictureId: 1,
      url: 'http://h1.ioliu.cn/bing/BrightonJetty_ZH-CN1526526038_1920x1080.jpg',
    ),
    Picture(
      pictureId: 2,
      url: 'http://h1.ioliu.cn/bing/AbiquaFalls_ZH-CN2781539758_1920x1080.jpg',
    ),
    Picture(
      pictureId: 3,
      url: 'http://h1.ioliu.cn/bing/CorsicaHeart_ZH-CN2795615037_1920x1080.jpg',
    ),
    Picture(
      pictureId: 4,
      url: 'http://h1.ioliu.cn/bing/TaikanCrane_ZH-CN3416122324_1920x1080.jpg',
    ),
    Picture(
      pictureId: 51,
      url:
          'http://h1.ioliu.cn/bing/HumpbackHerring_ZH-CN2868885675_1920x1080.jpg',
    ),
    Picture(
      pictureId: 9,
      url: 'http://h1.ioliu.cn/bing/SemucChampey_ZH-CN1774527432_1920x1080.jpg',
    ),
  ];
  AnswerCoverCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 25.0),
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            // UserInfoTitle(
            //   avatar: 'https://travel-1257167414.cos.ap-shanghai.myqcloud.com/avatar.jpg',
            //   nickname: 'nickname',
            //   date: '2018-02-08',
            //   isFollow: false,
            // ),
            _buildAnswerCoverContent(
              '安大略省警方哈利快速导航flask京东方哈里斯的理发安大略省警方哈利快速导航flask京东方哈里斯的理发师接电话flask决定恢复爱的是解放拉萨的金佛微软脾气安大略省警方哈利快速导航flask京东方哈里斯的理发师接电话flask决定恢复爱的是解放拉萨的金佛微软脾气安大略省警方哈利快速导航flask京东方哈里斯的理发师安大略省警方哈利快速导航flask京东方哈里斯的理发师接电话flask决定恢复爱的是解放拉萨的金佛微软脾气安大略省警方哈利快速导航flask京东方哈里斯的理发师接电话flask决定恢复爱的是解放拉萨的金佛微软脾气安大略省警方哈利快速导航flask京东方哈里斯的理发师接电话flask决定恢复爱的是解放拉萨的金佛微软脾气接电话flask决定恢复爱的是解放拉萨的金佛微软脾气师接电话flask决定恢复爱的是解放拉萨的金佛微软脾气',
              pictures,
            ),
            _buildAnswerCoverOptionInfo(1000, 6000, 97)
          ],
        ),
      ),
    );
  }

  _buildAnswerCoverOptionInfo(int thumbUpNum, int starNum, int commentNum) {
    double iconSize = 26.0;
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildIconAndNumber(
            Icon(
              Icons.thumb_up,
              size: iconSize,
            ),
            thumbUpNum,
          ),
          _buildIconAndNumber(
            Icon(
              Icons.star_border,
              size: iconSize,
            ),
            starNum,
          ),
          _buildIconAndNumber(
            Icon(
              Icons.comment,
              size: iconSize,
            ),
            commentNum,
          ),
        ],
      ),
    );
  }

  _buildIconAndNumber(Icon icon, int num) {
    List<Widget> children = [
      icon,
      SizedBox(width: 5.0),
    ];
    if (num != 0) {
      String text;
      if (num < 1000) {
        text = "$num";
      } else {
        int digit = "$num".length;
        String s;
        if (digit - 1 == 3) {
          s = "k+";
        } else if (digit - 1 == 4) {
          s = "w+";
        }
        text = "${(num / pow(10, (digit - 1))).ceil()}$s";
      }
      children.add(
        Text(
          text,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return Row(
      children: children,
    );
  }

  _buildAnswerCoverContent(String text, List<Picture> pictures) {
    List<Widget> children = [
      Text(
        text,
        maxLines: 7,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 17.0,
        ),
      ),
    ];
    if (pictures.length >= 3) {
      children.add(Container(
        height: 130.0,
        margin: EdgeInsets.only(top: 15.0),
        child: GridView.builder(
          itemCount: 3,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
          ),
          itemBuilder: _buildAnswerCoverCardPicture,
        ),
      ));
    }
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildAnswerCoverCardPicture(BuildContext context, int index) {
    Radius radius = Radius.circular(10.0);
    BoxShape shape = BoxShape.rectangle;
    String picture = pictures[index].url;
    BoxFit boxFit = BoxFit.cover;
    if (index == 1) {
      return ExtendedImage.network(
        picture,
        height: 130.0,
        fit: boxFit,
      );
    }
    if (index == 2) {
      return Stack(
        children: <Widget>[
          ExtendedImage.network(
            picture,
            shape: shape,
            fit: boxFit,
            height: 130.0,
            borderRadius: BorderRadius.only(
              topRight: radius,
              bottomRight: radius,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              borderRadius: BorderRadius.only(
                topRight: radius,
                bottomRight: radius,
              ),
            ),
            child: Text(
              '+${pictures.length - 3}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    }
    return ExtendedImage.network(
      picture,
      shape: shape,
      fit: boxFit,
      borderRadius: BorderRadius.only(
        topLeft: radius,
        bottomLeft: radius,
      ),
    );
  }
}
