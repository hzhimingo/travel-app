import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:travel/entity/spot.dart';
import 'package:travel/route/routes.dart';

class SpotCoverCard extends StatelessWidget {
  final Spot spot;
  const SpotCoverCard({Key key, @required this.spot}) : super(key: key);

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
                    spot.coverImage,
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
                          spot.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.0,
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
                      spot.keyword,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color.fromRGBO(187, 128, 41, 1.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      spot.area,
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
