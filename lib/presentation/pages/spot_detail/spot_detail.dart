import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class SpotDetail extends StatelessWidget {
  const SpotDetail({Key key}) : super(key: key);

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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              size: 30.0,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SpotBanner(),
            SpotInfo(),
            SpotHotMomentPool(),
            SpotQuestionPool(),
            SpotNearbyPool(),
            SpotMomentPool(),
          ],
        ),
      ),
    );
  }
}
