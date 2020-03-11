import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:travel/presentation/components/icon_with_number.dart';

class LikedUserLine extends StatelessWidget {
  final List<String> urls;
  final int favNum;
  const LikedUserLine({Key key, this.urls, this.favNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 300.0,
            height: 30.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: urls.length,
              itemBuilder: _builderCircleAvatarItem,
            ),
          ),
          Container(
            child: IconWithNumber(
              icon: Icon(
                Icons.favorite_border,
                size: 28.0,
              ),
              number: favNum,
            ),
          ),
        ],
      ),
    );
  }

  Widget _builderCircleAvatarItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(right:5.0),
      child: CircleAvatar(
        radius: 15.0,
        backgroundColor: Colors.black,
        backgroundImage: ExtendedNetworkImageProvider(
          urls[index],
        ),
      ),
    );
  }
}
