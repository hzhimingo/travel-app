import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:travel/entity/moment_cover.dart';
import 'package:travel/entity/picture.dart';
import 'package:travel/presentation/components/moment_cover_card.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class RecommendMomentPool extends StatelessWidget {
  const RecommendMomentPool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '精彩瞬间',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '更多',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black38,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 19.0,
                    color: Colors.black38,
                  ),
                ],
              ),
            ],
          ),
          WaterfallFlow.builder(
            padding: EdgeInsets.only(
              top: 15.0
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: SliverWaterfallFlowDelegate(
              crossAxisCount: 2,
              // collectGarbage: (List<int> garbages) {
              //   garbages.forEach(
              //     (index) {
              //       final provider = ExtendedNetworkImageProvider(
              //         state.momentCovers[index].coverImage.url,
              //       );
              //       provider.evict();
              //     },
              //   );
              // },
            ),
            itemBuilder: (context, index) => MomentCoverCard(
              momentCover: MomentCover(
                momentId: 1,
                favoriteNum: 34,
                isFavorite: 0,
                coverImage: Picture(
                  pictureId: 1,
                  url: 'https://n1-q.mafengwo.net/s15/M00/04/AA/CoUBGV5NFDmANXrcAArIWVUv4pU859.jpg?imageMogr2%2Fthumbnail%2F360x%2Fstrip%2Fquality%2F90',
                  width: 1440,
                  height: 1080,
                ),
                coverText: '埋在内心深处的一家小店，和有趣的人一起吃',
                authorAvatar: 'https://p1-q.mafengwo.net/s15/M00/96/01/CoUBGV4pHj6AdsKGAADkQCnAbQE62.jpeg',
                authorName: '小和尚爱慕与',
                location: '北京'
              ),
            ),
          )
        ],
      ),
    );
  }
}
