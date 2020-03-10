import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:travel/core/constant/iconfont.dart';
import 'package:travel/core/util/number_convert.dart';
import 'package:travel/entity/topic_cover.dart';

class TopicCoverCard extends StatelessWidget {
  final TopicCover topicCover;

  const TopicCoverCard({Key key, this.topicCover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: ((MediaQuery.of(context).size.width - 50.0) / 3) + 105.0,
        child: Column(
          children: <Widget>[
            Container(
              height: 45.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        IconData(
                          IconFonts.sharp,
                          fontFamily: 'IconFont',
                        ),
                        color: Theme.of(context).primaryColor,
                        size: 20.0,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        topicCover.name,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                          children: [
                            TextSpan(
                              text: NumberConvert.convertNumberToString(topicCover.momentNum),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: '瞬间·'),
                            TextSpan(
                              text: NumberConvert.convertNumberToString(topicCover.commentNum),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: '人热议中'),
                          ],
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                _showItem(
                  topicCover.momentCovers[0].coverImage.url,
                  topicCover.momentCovers[0].coverText,
                  context,
                ),
                SizedBox(width: 10.0),
                _showItem(
                  topicCover.momentCovers[1].coverImage.url,
                  topicCover.momentCovers[1].coverText,
                  context,
                ),
                SizedBox(width: 10.0),
                _showItem(
                  topicCover.momentCovers[2].coverImage.url,
                  topicCover.momentCovers[2].coverText,
                  context,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showItem(String imageUrl, String text, BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 50.0) / 3,
      height: ((MediaQuery.of(context).size.width - 50.0) / 3) + 60.0,
      child: Column(
        children: <Widget>[
          ExtendedImage.network(
            imageUrl,
            cache: true,
            fit: BoxFit.cover,
            width: (MediaQuery.of(context).size.width - 50.0) / 3,
            height: (MediaQuery.of(context).size.width - 50.0) / 3,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 50.0,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
