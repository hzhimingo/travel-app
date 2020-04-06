import 'package:flutter/material.dart';

class TimeAndOption extends StatefulWidget {
  final String time;
  final int thumbUpNum;
  final int commentNum;
  final bool isThumbUp;
  TimeAndOption({
    Key key,
    @required this.time,
    @required this.thumbUpNum,
    this.commentNum,
    @required this.isThumbUp,
  }) : super(key: key);

  @override
  _TimeAndOptionState createState() => _TimeAndOptionState();
}

class _TimeAndOptionState extends State<TimeAndOption> {
  bool isThumbUp = false;

  @override
  void initState() {
    super.initState();
    isThumbUp = widget.isThumbUp;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          widget.time,
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.grey[500],
          ),
        ),
        Row(
          children: _buildOption(),
        ),
      ],
    );
  }

  _buildOption() {
    List<Widget> children = List();
    children.add(Row(
      children: <Widget>[
        Icon(
          Icons.thumb_up,
          size: 17.0,
          color: Colors.grey[400],
        ),
        SizedBox(width: 5.0),
        Text(
          '${widget.thumbUpNum}',
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.grey[400],
          ),
        ),
      ],
    ));
    children.add(SizedBox(width: 20.0));
    if (widget.commentNum != null) {
      children.add(Row(
        children: <Widget>[
          Icon(
            Icons.comment,
            size: 17.0,
            color: Colors.grey[500],
          ),
          SizedBox(width: 5.0),
          Text(
            '${widget.commentNum}',
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.grey[400],
            ),
          ),
        ],
      ));
    }
    return children;
  }
}
