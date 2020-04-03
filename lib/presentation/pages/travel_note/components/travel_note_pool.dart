import 'package:flutter/material.dart';

import './travel_note_cover_card.dart';

class TravelNotePool extends StatelessWidget {
  const TravelNotePool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '全部游记',
            style: TextStyle(
              fontSize: 19.0,
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 20.0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => TravelNoteCoverCard(),
          ),
        ],
      ),
    );
  }
}
