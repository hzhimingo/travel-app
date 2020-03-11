import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MomentContent extends StatelessWidget {
  final String text;
  const MomentContent({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15.0,
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
      ),
      child: ExpandableNotifier(
        child: Expandable(
          collapsed: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: _splitText(text, context),
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                ),
                WidgetSpan(
                  child: ExpandableButton(
                    child: Text(
                      '展开',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          expanded: Text(
            text,
            softWrap: true,
            style: TextStyle(fontSize: 17.0),
          ),
        ),
      ),
    );
  }

  String _splitText(String text, BuildContext context) {
    TextPainter painter = TextPainter(
      maxLines: 8,
      textDirection: TextDirection.ltr,
      text: TextSpan(
          text: text,
          style: TextStyle(
            fontSize: 17.0,
          )),
    )..layout(
        maxWidth: MediaQuery.of(context).size.width,
        minWidth: MediaQuery.of(context).size.width,
      );
    if (painter.didExceedMaxLines) {
      int end = (text.length / 2).floor();
      return text.substring(0, end) + "...";
    } else {
      return text;
    }
  }
}
