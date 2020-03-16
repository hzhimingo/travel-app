import 'package:flutter/material.dart';

class BottomActionPanel extends StatelessWidget {
  const BottomActionPanel({Key key}) : super(key: key);

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
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.comment),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
