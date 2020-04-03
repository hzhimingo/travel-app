import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class RegionPool extends StatelessWidget {
  const RegionPool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(15.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) => _RegionItem(),
    );
  }
}

class _RegionItem extends StatelessWidget {
  const _RegionItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExtendedNetworkImageProvider(
                    'http://p1-q.mafengwo.net/s15/M00/A6/33/CoUBGV5vNiyActl4AEQ3SQOnyiQ901.jpg',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '江西',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}