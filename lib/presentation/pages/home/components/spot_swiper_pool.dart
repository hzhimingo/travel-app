import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SpotSwiperPool extends StatelessWidget {
  const SpotSwiperPool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240.0,
      child: Swiper(
        outer: true,
        itemCount: 5,
        itemBuilder: (context, index) => _SpotSwiperItem(),
        // pagination: SwiperPagination(
        //   margin: EdgeInsets.only(
        //     top: 5.0,
        //     bottom: 5.0,
        //   )
        // ),
      ),
    );
  }
}

class _SpotSwiperItem extends StatelessWidget {
  const _SpotSwiperItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset.zero,
              blurRadius: 5.0,
              spreadRadius: 5.0,
              color: Color.fromRGBO(246, 247, 249, 1.0),
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExtendedNetworkImageProvider(
                      'http://b1-q.mafengwo.net/s11/M00/AA/51/wKgBEFqVaReATAGUAAutXAiEoyQ55.jpeg',
                    ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '横店影视城',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 219, 37, 1.0),
                          size: 17.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 219, 37, 1.0),
                          size: 17.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 219, 37, 1.0),
                          size: 17.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 219, 37, 1.0),
                          size: 17.0,
                        ),
                        Icon(
                          Icons.star_half,
                          color: Color.fromRGBO(255, 219, 37, 1.0),
                          size: 17.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
