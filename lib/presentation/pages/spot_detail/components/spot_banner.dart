import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class SpotBanner extends StatelessWidget {
  const SpotBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 230.0,
      child: ListView(
        padding: EdgeInsets.all(15.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 320.0,
            height: 230.0,
            margin: EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExtendedNetworkImageProvider(
                  'https://n1-q.mafengwo.net/s11/M00/46/1A/wKgBEFrsPkeARLM7AAEBBbum5WQ58.jpeg'
                )
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            width: 320.0,
            height: 230.0,
            margin: EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExtendedNetworkImageProvider(
                  'https://n1-q.mafengwo.net/s12/M00/37/05/wKgED1vN30-AP3EdAAhmMYBv9YI45.jpeg'
                )
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            width: 320.0,
            height: 230.0,
            margin: EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExtendedNetworkImageProvider(
                  'https://n1-q.mafengwo.net/s1/M00/6F/50/wKgIC1xWmuKAIRc8ABvON1lfBS461.jpeg'
                )
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }
}