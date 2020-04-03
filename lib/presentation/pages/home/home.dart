import 'package:extended_image/extended_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SpotSwiperPool(),
            HomeActionPanel(),
            HotCityPanel(),
            HotTravelNotePool(),
            HotTopicPool(),
            RecommendMomentPool(),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      title: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  GlobalRoute.router.navigateTo(
                    context,
                    '/search',
                    transition: TransitionType.cupertino,
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.0),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset.zero,
                        blurRadius: 8.0,
                        spreadRadius: 2.0,
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        color: Colors.black38,
                        size: 20.0,
                      ),
                      Text(
                        '大家都在搜：清明踏青',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExtendedNetworkImageProvider(
                    'https://p1-q.mafengwo.net/s15/M00/96/01/CoUBGV4pHj6AdsKGAADkQCnAbQE62.jpeg?imageMogr2%2Fthumbnail%2F%21120x120r%2Fgravity%2FCenter%2Fcrop%2F%21120x120%2Fquality%2F90',
                  ),
                ),
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset.zero,
                    blurRadius: 5.0,
                    spreadRadius: 3.0,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
