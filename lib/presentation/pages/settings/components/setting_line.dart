import 'package:flutter/material.dart';

class SettingLine extends StatelessWidget {
  final Widget leading;
  final Widget tail;
  final Widget tailText;
  final VoidCallback onPressed;
  const SettingLine({
    Key key,
    @required this.leading,
    @required this.tail,
    this.tailText,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> tailChildren = [tail];
    if (tailText != null) {
      tailChildren.insert(0, tailText);
    }
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: 18.0,
            bottom: 18.0,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[100],
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              leading,
              Row(
                children: <Widget>[
                  Offstage(
                    child: tailText,
                  ),
                  tail,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  factory SettingLine.defaultLine({
    @required String leaingText,
    @required VoidCallback onPressed,
  }) {
    TextStyle defaultTextStyle = TextStyle(
        color: Colors.black87,
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'PingFangSCThin');
    return SettingLine(
      leading: Text(
        leaingText,
        style: defaultTextStyle,
      ),
      tail: Icon(
        Icons.arrow_forward_ios,
        size: 19.0,
      ),
      onPressed: () => onPressed(),
    );
  }
}
