import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class Pop extends StatelessWidget {
  const Pop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: MediaQueryData.fromWindow(window).padding.top,
          bottom: 30.0,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 9.0,
            sigmaY: 9.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      GlobalRoute.router.pop(context);
                      GlobalRoute.router.navigateTo(context, '/editMoment');
                    },
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 28.0,
                ),
                onPressed: () {
                  GlobalRoute.router.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
