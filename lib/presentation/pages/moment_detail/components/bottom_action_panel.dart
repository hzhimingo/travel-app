import 'package:flutter/material.dart';
import 'package:travel/presentation/components/icon_with_number.dart';

class BottomActionPanel extends StatefulWidget {
  final bool isFav;
  final bool isStar;
  final int favNum;
  final int starNum;
  final int commentNum;

  BottomActionPanel({
    Key key,
    this.isFav,
    this.isStar,
    this.favNum,
    this.starNum,
    this.commentNum,
  }) : super(key: key);

  @override
  _BottomActionPanelState createState() => _BottomActionPanelState();
}

class _BottomActionPanelState extends State<BottomActionPanel> {
  bool isFav;
  bool isStar;
  int favNum;
  int starNum;
  int commentNum;

  @override
  void initState() {
    super.initState();
    isFav = widget.isFav;
    isStar = widget.isStar;
    favNum = widget.favNum;
    starNum = widget.starNum;
    commentNum = widget.commentNum;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: IconWithNumber(
              icon: Icon(
                Icons.comment,
                size: 28.0,
              ),
              number: 12,
            ),
          ),
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
                color: isFav ? Colors.redAccent : Colors.black,
                size: 28.0,
              ),
              number: favNum,
            ),
          ),
          GestureDetector(
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
                isStar ? Icons.star : Icons.star_border,
                color: isStar ? Colors.yellow : Colors.black,
                size: 28.0,
              ),
              number: starNum,
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 300.0,
                    color: Colors.white,
                  );
                },
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: 110.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Text(
                '文中提及',
                style: TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
