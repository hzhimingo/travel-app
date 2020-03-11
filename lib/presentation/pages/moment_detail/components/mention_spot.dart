import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:travel/entity/spot.dart';

class MentionSpot extends StatelessWidget {
  final Spot spot;
  const MentionSpot({Key key, this.spot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              '文中提及',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            width: MediaQuery.of(context).size.width,
            height: 140.0,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: _buildMentionSpotItem,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMentionSpotItem(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120.0,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 5.0,
              spreadRadius: 3.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        padding: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 10.0,
          right: 10.0,
        ),
        child: Row(
          children: <Widget>[
            ExtendedImage.network(
              spot.thumbnail,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          spot.name,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: <Widget>[
                            Text(
                              '${spot.commentNum}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              '篇点评',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      '位于${spot.city}',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black45,
                      ),
                    )
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