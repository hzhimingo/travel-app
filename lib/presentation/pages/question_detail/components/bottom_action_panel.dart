import 'package:flutter/material.dart';

class BottomActionPanel extends StatefulWidget {
  final bool isCollect;
  final int collectNum;
  BottomActionPanel({
    Key key,
    this.isCollect,
    this.collectNum,
  }) : super(key: key);

  @override
  _BottomActionPanelState createState() => _BottomActionPanelState();
}

class _BottomActionPanelState extends State<BottomActionPanel> {

  int collectNum = 0;
  bool isCollect = false;

  @override
  void initState() {
    super.initState();
    collectNum = widget.collectNum;
    isCollect = widget.isCollect;
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
            offset: Offset.zero,
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: 30.0,
        right: 30.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (isCollect) {
                setState(() {
                  isCollect = !isCollect;
                });
              } else {
                setState(() {
                  isCollect = !isCollect;
                });
              }
            },
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add_circle_outline,
                    size: 27.0,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    isCollect ? '已关注' : '关注问题($collectNum)',
                    style: TextStyle(fontSize: 17.0),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.mode_edit,
                    size: 27.0,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '添加回答',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
