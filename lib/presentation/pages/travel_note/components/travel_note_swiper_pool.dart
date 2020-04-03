import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TravelNoteSwiperPool extends StatelessWidget {
  const TravelNoteSwiperPool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 330.0,
      child: Swiper(
        itemCount: 5,
        itemBuilder: (context, index) => _TravelNoteSwiperItem(),
      ),
    );
  }
}

class _TravelNoteSwiperItem extends StatelessWidget {
  const _TravelNoteSwiperItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(246, 247, 249, 1.0),
                spreadRadius: 10.0,
                blurRadius: 15.0,
                offset: Offset.zero,
              )
            ]),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExtendedNetworkImageProvider(
                      'http://p1-q.mafengwo.net/s15/M00/A6/33/CoUBGV5vNiyActl4AEQ3SQOnyiQ901.jpg',
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                alignment: Alignment.center,
                child: Text(
                  '生命中那些闪亮的日子福利机构老师打分结果立法机构老师的房价很高电风扇电机和法律上的.',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
