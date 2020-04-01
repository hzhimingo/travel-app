import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class SpotNearbyPool extends StatelessWidget {
  const SpotNearbyPool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(15.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '附近推荐',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '共12个推荐',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black38,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18.0,
                    color: Colors.black38,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15.0),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.8,
            ),
            itemCount: 6,
            itemBuilder: (context, index) => _NearBySpotItem(),
          ),
        ],
      ),
    );
  }
}

class _NearBySpotItem extends StatelessWidget {
  const _NearBySpotItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExtendedNetworkImageProvider(
                      'https://p1-q.mafengwo.net/s15/M00/96/01/CoUBGV4pHj6AdsKGAADkQCnAbQE62.jpeg?imageMogr2%2Fthumbnail%2F%21120x120r%2Fgravity%2FCenter%2Fcrop%2F%21120x120%2Fquality%2F90'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '北京野生动物园',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14,
                          ),
                        ],
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '46条',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  Text('距景点241m')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
