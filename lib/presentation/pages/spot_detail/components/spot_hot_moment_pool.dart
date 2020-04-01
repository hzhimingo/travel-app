import 'package:flutter/material.dart';

import './spot_moment_card.dart';

class SpotHotMomentPool extends StatelessWidget {
  const SpotHotMomentPool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(
        top: 15.0,
        bottom: 15.0,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '达人攻略',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '1436条精华攻略',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black38,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 17.0,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            //color: Colors.blue,
            height: 340.0,
            child: ListView.builder(
              padding: EdgeInsets.all(15.0),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => Container(
                width: MediaQuery.of(context).size.width - 30.0,
                margin: EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(246, 247, 249, 1.0),
                      offset: Offset.zero,
                      blurRadius: 3.0,
                      spreadRadius: 3.0,
                    ),
                  ],
                ),
                child: SpotMomentCard(
                  padding: EdgeInsets.all(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
