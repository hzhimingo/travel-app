import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:travel/entity/picture.dart';

class MomentDetailPicturePool extends StatelessWidget {
  final List<Picture> pictures;
  const MomentDetailPicturePool({
    Key key,
    @required this.pictures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      color: Colors.yellow,
    );
  }
}
