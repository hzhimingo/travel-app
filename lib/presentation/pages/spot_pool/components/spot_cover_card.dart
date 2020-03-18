import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class SpotCoverCard extends StatelessWidget {
  const SpotCoverCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GlobalRoute.router.navigateTo(context, '/spotDetail');
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 10.0,
          bottom: 10.0,
        ),
        margin: EdgeInsets.only(bottom: 5.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExtendedNetworkImageProvider(
                    'https://p1-q.mafengwo.net/s15/M00/F8/CC/CoUBGV5O9p2AFPydABCIPleSu7022.jpeg?imageMogr2%2Fthumbnail%2F%21600x600r%2Fstrip%2Fquality%2F90%7Cwatermark%2F1%2Fimage%2FaHR0cHM6Ly9wMS1xLm1hZmVuZ3dvLm5ldC9zMTMvTTAwLzkyLzNEL3dLZ0VhVnhfaFRXQUFrVEVBQUJmN1M4NUt2MDI2Mi5wbmc_aW1hZ2VNb2dyMiUyRnRodW1ibmFpbCUyRjgxeCUyRnN0cmlwJTJGcXVhbGl0eSUyRjkw%2Fgravity%2FSouthWest%2Fdx%2F18%2Fdy%2F18',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 100.0,
                margin: EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '故宫',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkResponse(
                          child: Icon(Icons.star_border),
                          onTap: () {},
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(255, 219, 37, 1.0),
                              size: 15.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(255, 219, 37, 1.0),
                              size: 15.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(255, 219, 37, 1.0),
                              size: 15.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(255, 219, 37, 1.0),
                              size: 15.0,
                            ),
                            Icon(
                              Icons.star_half,
                              color: Color.fromRGBO(255, 219, 37, 1.0),
                              size: 15.0,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              '2.3万条',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '4.8w',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '世界五大宫之首',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color.fromRGBO(187, 128, 41, 1.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '滕王阁商圈',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black45,
                      ),
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
