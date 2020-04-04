import 'package:flutter/material.dart';

class ExpandedText extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  const ExpandedText({
    Key key,
    @required this.text,
    EdgeInsets padding,
  }) : padding = padding ?? EdgeInsets.zero,
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  _resloveTextToWidgets (String text) {
    
  }
}