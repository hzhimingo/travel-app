import 'package:flutter/widgets.dart';

class ExtendedIcon extends StatelessWidget {
  final Icon icon;
  final Text text;
  final double gap;
  const ExtendedIcon({
    Key key,
    this.icon,
    this.text,
    double gap,
  })  : gap = gap ?? 3.0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(
          height: gap,
        ),
        text
      ],
    );
  }
}
