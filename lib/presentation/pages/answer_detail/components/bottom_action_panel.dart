import 'package:flutter/material.dart';
import 'package:travel/presentation/components/icon_with_number.dart';

class BottomActionPanel extends StatefulWidget {
  final int favNum;
  final int collectNum;
  final int commentNum;
  final bool isFav;
  final bool isCollect;
  BottomActionPanel({
    Key key,
    this.favNum,
    this.isFav,
    this.collectNum,
    this.commentNum,
    this.isCollect,
  }) : super(key: key);

  @override
  _BottomActionPanelState createState() => _BottomActionPanelState();
}

class _BottomActionPanelState extends State<BottomActionPanel> {
  int favNum = 0;
  int collectNum = 0;
  int commentNum = 0;
  bool isFav = false;
  bool isCollect = false;

  @override
  void initState() {
    super.initState();
    this.favNum = widget.favNum;
    this.collectNum = widget.collectNum;
    this.commentNum = widget.commentNum;
    this.isCollect = widget.isCollect;
    this.isFav = widget.isFav;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 2.0,
          spreadRadius: 2.0,
          offset: Offset.zero,
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
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
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.redAccent : Colors.grey,
              ),
              number: favNum,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (isCollect) {
                setState(() {
                  isCollect = !isCollect;
                  collectNum = collectNum - 1;
                });
              } else {
                setState(() {
                  isCollect = !isCollect;
                  collectNum = collectNum + 1;
                });
              }
            },
            child: IconWithNumber(
              icon: Icon(
                isCollect ? Icons.star : Icons.star_border,
                color: isCollect ? Colors.yellowAccent : Colors.grey,
              ),
              number: collectNum,
            ),
          ),
          IconWithNumber(
            icon: Icon(Icons.comment),
            number: commentNum,
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
