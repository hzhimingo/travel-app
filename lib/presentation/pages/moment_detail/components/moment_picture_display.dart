import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:travel/entity/picture.dart';


class MomentPictureDisplay extends StatelessWidget {
  final List<Picture> pictures;
  const MomentPictureDisplay({Key key, this.pictures}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: Swiper(
        itemWidth: double.infinity,
        itemHeight: 350.0,
        itemCount: pictures.length,
        itemBuilder: _buildSwiperItem,
        pagination: SwiperCustomPagination(
          builder: (BuildContext context, SwiperPluginConfig config) {
            return Positioned(
              right: 10.0,
              bottom: 10.0,
              child: Container(
                padding: EdgeInsets.only(
                  left: 5.0,
                  right: 5.0,
                  top: 3.0,
                  bottom: 3.0,
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  '${config.activeIndex + 1}/${config.itemCount}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSwiperItem(BuildContext context, int index) {
    return ExtendedImage.network(pictures[index].url,
        width: double.infinity, height: 350.0, cache: true, fit: BoxFit.cover);
  }
}