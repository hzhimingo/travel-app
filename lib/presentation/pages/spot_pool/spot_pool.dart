import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class SpotPool extends StatefulWidget {
  SpotPool({Key key}) : super(key: key);

  @override
  _SpotPoolState createState() => _SpotPoolState();
}

class _SpotPoolState extends State<SpotPool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => GlobalRoute.router.pop(context),
        ),
        title: Container(
          width: double.infinity,
          height: 40.0,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.black38,
                size: 19.0,
              ),
              SizedBox(width: 5.0),
              Text(
                '搜索背景景点玩乐',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          child: FilterTabBar(),
          preferredSize: Size.fromHeight(45.0),
        ),
      ),
      body: FilterContent(
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, state) => SpotCoverCard(),
        ),
      ),
    );
  }
}
