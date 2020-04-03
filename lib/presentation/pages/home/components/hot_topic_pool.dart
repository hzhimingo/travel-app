import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class HotTopicPool extends StatelessWidget {
  const HotTopicPool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: 80.0,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => _HotTopicItem(),
      ),
    );
  }
}

class _HotTopicItem extends StatelessWidget {
  const _HotTopicItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExtendedNetworkImageProvider(
            'http://p1-q.mafengwo.net/s15/M00/A6/33/CoUBGV5vNiyActl4AEQ3SQOnyiQ901.jpg',
          ),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color.fromRGBO(0, 0, 0, 0.3)),
            child: Text(
              '#最美的瞬间使得开发商的',
              maxLines: 2,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
