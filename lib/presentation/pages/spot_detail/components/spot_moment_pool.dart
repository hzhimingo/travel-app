import 'package:flutter/material.dart';

import './spot_moment_card.dart';

class SpotMomentPool extends StatelessWidget {
  const SpotMomentPool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '优质点评',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: SpotMomentCard(),
            ),
          ),
        ],
      ),
    );
  }
}
