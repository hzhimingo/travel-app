import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class HotCityPanel extends StatelessWidget {
  const HotCityPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 5.0,
              right: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '热门城市',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '更多',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black38,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 19.0,
                      color: Colors.black38,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 120.0,
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => _HotCityItem(),
            ),
          ),
        ],
      ),
    );
  }
}

class _HotCityItem extends StatelessWidget {
  const _HotCityItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExtendedNetworkImageProvider(
            'http://n1-q.mafengwo.net/s12/M00/37/05/wKgED1vN30-AP3EdAAhmMYBv9YI45.jpeg',
          ),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            color: Color.fromRGBO(246, 247, 249, 1.0),
            spreadRadius: 3.0,
            blurRadius: 3.0,
          )
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 60.0,
            child: Container(
              alignment: Alignment.center,
              width: 60.0,
              height: 20.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.4),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                )
              ),
              child: Text(
                '北京',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
