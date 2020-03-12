import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:travel/presentation/blocs/moment_detail/moment_detail_bloc.dart';
import 'package:travel/route/routes.dart';
import 'package:extended_image/extended_image.dart';

import './components/components.dart';

class MomentDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            GlobalRoute.router.pop(context);
          },
        ),
        title: Row(
          children: <Widget>[
            BlocBuilder<MomentDetailBloc, MomentDetailState>(
              builder: (context, state) {
                if (state is MomentDetailLoaded) {
                  return CircleAvatar(
                    radius: 22.0,
                    backgroundImage: ExtendedNetworkImageProvider(
                      state.momentDetail.avatar,
                    ),
                  );
                } else {
                  return CircleAvatar(
                    radius: 20.0,
                    backgroundImage: ExtendedNetworkImageProvider(
                      'https://assets.leetcode-cn.com/aliyun-lc-upload/default_avatar.png',
                    ),
                  );
                }
              },
            ),
            SizedBox(width: 8.0),
            BlocBuilder<MomentDetailBloc, MomentDetailState>(
              builder: (context, state) {
                if (state is MomentDetailLoaded) {
                  return Text(
                    state.momentDetail.nickname,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  );
                } else {
                  return Text('');
                }
              },
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<MomentDetailBloc, MomentDetailState>(
        builder: (context, state) {
          if (state is MomentDetailLoaded) {
            return Stack(
              children: <Widget>[
                SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 60.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MomentPicturePool(pictures: state.momentDetail.pictures),
                      Offstage(
                        offstage: state.momentDetail.title == null,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20.0,
                            left: 15.0,
                            right: 15.0,
                            bottom: 15.0,
                          ),
                          child: Text(
                            state.momentDetail.title,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'PingFangSCLight',
                            ),
                          ),
                        ),
                      ),
                      LocationLine(
                        country: state.momentDetail.country,
                        city: state.momentDetail.city,
                        location: state.momentDetail.locationName,
                      ),
                      MomentContent(text: state.momentDetail.content),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text('${state.momentDetail.releaseDate}发布'),
                      ),
                      MentionSpot(
                        spots: state.momentDetail.spots,
                      ),
                      LikedUserLine(
                        urls: state.momentDetail.favUsers,
                        favNum: state.momentDetail.favNum,
                      ),
                      CommentInputLine(),
                    ],
                  ),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  child: BottomActionPanel(
                    favNum: state.momentDetail.favNum,
                    starNum: state.momentDetail.starNum,
                    commentNum: state.momentDetail.commentNum,
                    isFav: state.momentDetail.isFav,
                    isStar: state.momentDetail.isStar,
                  ),
                ),
              ],
            );
          } else if (state is MomentDetailEmpty) {
            return Center(
              child: SpinKitThreeBounce(
                color: Theme.of(context).primaryColor,
                size: 33.0,
              ),
            );
          } else {
            return Center(
              child: Text('Fail....'),
            );
          }
        },
      ),
    );
  }
}
