import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HotTopicShimmer extends StatelessWidget {
  const HotTopicShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: false,
      baseColor: Colors.grey[200],
      highlightColor: Colors.grey[100],
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Row(
          children: <Widget>[
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 30.0,
                        height: 30.0,
                        margin: EdgeInsets.only(right: 10.0),
                        color: Colors.white,
                      ),
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 30.0,
                        height: 30.0,
                        margin: EdgeInsets.only(right: 10.0),
                        color: Colors.white,
                      ),
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 30.0,
                        height: 30.0,
                        margin: EdgeInsets.only(right: 10.0),
                        color: Colors.white,
                      ),
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
