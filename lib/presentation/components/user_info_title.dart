import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class UserInfoTitle extends StatelessWidget {
  final String avatar;
  final String nickname;
  final String dateTime;

  const UserInfoTitle({
    Key key,
    this.avatar,
    this.nickname,
    this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 20.0,
            backgroundImage: ExtendedNetworkImageProvider(
              avatar,
            ),
            backgroundColor: Color.fromRGBO(246, 247, 249, 1.0),
          ),
          SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                nickname,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '编辑于${dateTime}',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
