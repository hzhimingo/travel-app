import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:travel/presentation/components/picture_flow.dart';

class FollowArticle extends StatefulWidget {
  FollowArticle({Key key}) : super(key: key);

  @override
  _FollowArticleState createState() => _FollowArticleState();
}

class _FollowArticleState extends State<FollowArticle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200],
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: ExtendedNetworkImageProvider(
              'https://travel-1257167414.cos.ap-shanghai.myqcloud.com/avatar.jpg',
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContent() {
    List<Widget> content = [];
    content.add(_buildNameAndTime('Hello', '18小时前'));
    content.add(_buildText(
        "HelloHelloHelloHelloHelloHello\n是领导反馈结果还是老地方价格f公司的立法机关还是老地方结果还是来得及分公司领导飞机公司联合东风破不错吧分公司法机构数量大幅价格好商量的房价很高司哦人图片我i而退票微软"));
    content.add(_buildPictures());
    content.add(_buildLocation());
    content.add(_buildMomentOptions());
    return content;
  }

  ///昵称和发布时间
  Widget _buildNameAndTime(String nikname, String time) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            nikname,
            style: TextStyle(fontSize: 15.0, color: Colors.black54),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 12.0, color: Colors.black38),
          ),
        ],
      ),
    );
  }

  ///文本内容
  Widget _buildText(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.0, right: 30.0),
      margin: EdgeInsets.only(top: 6.0, bottom: 10.0),
      child: Text(
        text,
        style: TextStyle(
          height: 1.5,
          fontSize: 15.0,
          color: Colors.black87,
        ),
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  ///图片
  Widget _buildPictures() {
    final List<PictureItem> images = [
      PictureItem(
        url: 'https://i.loli.net/2020/02/08/rC3ItDwAqlovgWE.jpg',
        width: 1080,
        height: 1920,
      ),
      PictureItem(
        url: 'https://i.loli.net/2020/02/08/rC3ItDwAqlovgWE.jpg',
        width: 1080,
        height: 1920,
      ),
      PictureItem(
        url: 'https://i.loli.net/2020/02/08/rC3ItDwAqlovgWE.jpg',
        width: 1080,
        height: 1920,
      ),
      PictureItem(
        url: 'https://i.loli.net/2020/02/08/rC3ItDwAqlovgWE.jpg',
        width: 1080,
        height: 1920,
      ),
      PictureItem(
        url: 'https://i.loli.net/2020/02/08/rC3ItDwAqlovgWE.jpg',
        width: 1080,
        height: 1920,
      ),
      PictureItem(
        url: 'https://i.loli.net/2020/02/08/rC3ItDwAqlovgWE.jpg',
        width: 1080,
        height: 1920,
      ),
      PictureItem(
        url: 'https://i.loli.net/2020/02/08/rC3ItDwAqlovgWE.jpg',
        width: 1080,
        height: 1920,
      ),
      PictureItem(
        url: 'https://i.loli.net/2020/02/08/rC3ItDwAqlovgWE.jpg',
        width: 1080,
        height: 1920,
      ),
      PictureItem(
        url: 'https://i.loli.net/2020/02/08/rC3ItDwAqlovgWE.jpg',
        width: 1080,
        height: 1920,
      ),
      PictureItem(
        url: 'https://i.loli.net/2020/02/08/rC3ItDwAqlovgWE.jpg',
        width: 1080,
        height: 1920,
      ),
    ];
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: PictureFlow(
        images: images,
      ),
    );
  }

  ///地理位置信息
  Widget _buildLocation() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 6.0),
      padding: EdgeInsets.only(left: 10.0),
      child: Text(
        '深圳市',
        style: TextStyle(),
      ),
    );
  }

  ///操作栏
  Widget _buildMomentOptions() {
    return MomentOptions(
      isFav: 0,
      isStar: 1,
      favNum: 100,
      starNum: 34,
    );
  }
}

class MomentOptions extends StatefulWidget {
  final int isFav;
  final int isStar;
  final int favNum;
  final int starNum;

  MomentOptions({Key key, this.isFav, this.isStar, this.favNum, this.starNum})
      : super(key: key);

  @override
  _MomentOptionsState createState() => _MomentOptionsState();
}

class _MomentOptionsState extends State<MomentOptions> {
  bool isFav;
  bool isStar;
  int favNum;
  int starNum;
  final TextStyle _numTextStyle = TextStyle(
    color: Colors.black38,
    fontSize: 15.0,
  );

  @override
  void initState() {
    super.initState();
    isFav = widget.isFav == 0 ? false : true;
    isStar = widget.isStar == 0 ? false : true;
    favNum = widget.favNum;
    starNum = widget.starNum;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: null),
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.redAccent : Colors.grey,
                    ),
                    onPressed: () {
                      if (isFav) {
                      } else {}
                      setState(() {
                        if (isFav) {
                          favNum = favNum - 1;
                        } else {
                          favNum = favNum + 1;
                        }
                        isFav = !isFav;
                      });
                    },
                  ),
                  Text(
                    '${favNum != 0 ? favNum : ''}',
                    style: _numTextStyle,
                  ),
                ],
              ),
              SizedBox(width: 5.0),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      isStar ? Icons.star : Icons.star_border,
                      color: isStar ? Colors.yellowAccent : Colors.grey,
                    ),
                    onPressed: () {
                      if (isStar) {
                      } else {}
                      setState(() {
                        if (isStar) {
                          starNum = starNum - 1;
                        } else {
                          starNum = starNum + 1;
                        }
                        isStar = !isStar;
                      });
                    },
                  ),
                  Text(
                    '${starNum != 0 ? starNum : ''}',
                    style: _numTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
