import 'package:flutter/material.dart';

class CitySelectorRight extends StatelessWidget {
  final int currentIndex;
  final List<Widget> children;
  const CitySelectorRight({
    Key key,
    @required this.currentIndex,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        color: Colors.white,
        child: children[currentIndex],
      ),
    );
  }
}