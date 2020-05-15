import 'package:flutter/material.dart';
import 'package:travel/core/constant/iconfont.dart';
import 'package:travel/presentation/components/icon_with_number.dart';

class CardOptions extends StatefulWidget {
  final bool isStar;
  final bool isFav;
  final int starNum;
  final int favNum;
  final int commentNum;

  CardOptions({
    Key key,
    this.starNum,
    this.isFav,
    this.isStar,
    this.favNum,
    this.commentNum,
  }) : super(key: key);

  @override
  _CardOptionsState createState() => _CardOptionsState();
}

class _CardOptionsState extends State<CardOptions> {
  bool isStar;
  bool isFav;
  int starNum;
  int favNum;
  int commentNum;

  @override
  void initState() {
    super.initState();
    isStar = widget.isStar;
    isFav = widget.isFav;
    starNum = widget.starNum;
    favNum = widget.favNum;
    commentNum = widget.commentNum;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkResponse(
            onTap: () {
              if (isFav) {
                setState(() {
                  isFav = !isFav;
                  favNum = favNum - 1;
                });
              } else {
                setState(() {
                  isFav = !isFav;
                  favNum = favNum + 1;
                });
              }
            },
            child: IconWithNumber(
              icon: Icon(
                IconData(
                  isFav ? IconFonts.like_fill : IconFonts.like,
                  fontFamily: 'IconFont',
                ),
                color: isFav ? Colors.redAccent : Colors.black,
                size: 27.0,
              ),
              number: favNum,
            ),
          ),
          InkResponse(
            onTap: () {
              if (isStar) {
                setState(() {
                  isStar = !isStar;
                  starNum = starNum - 1;
                });
              } else {
                setState(() {
                  isStar = !isStar;
                  starNum = starNum + 1;
                });
              }
            },
            child: IconWithNumber(
              icon: Icon(
                IconData(
                  isStar ? IconFonts.star_fill : IconFonts.star,
                  fontFamily: 'IconFont',
                ),
                size: 27.0,
                color: isStar ? Colors.yellow : Colors.black,
              ),
              number: starNum,
            ),
          ),
          InkResponse(
            onTap: () {},
            child: IconWithNumber(
              icon: Icon(
                IconData(
                  IconFonts.comment,
                  fontFamily: 'IconFont',
                ),
                size: 27.0,
              ),
              number: commentNum,
            ),
          ),
          InkResponse(
            onTap: () {},
            child: Icon(
              IconData(IconFonts.share, fontFamily: 'IconFont'),
              size: 27.0,
            ),
          ),
        ],
      ),
    );
  }
}
