import 'package:flutter/material.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/collect/collect_bloc.dart';
import 'package:travel/presentation/blocs/comment_cover_pool/comment_cover_pool_bloc.dart';
import 'package:travel/presentation/blocs/thumbup/thumbup_bloc.dart';
import 'package:travel/presentation/components/comment/comment_cover_pool.dart';
import 'package:travel/route/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:travel/presentation/blocs/moment_detail/moment_detail_bloc.dart';

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
                        country: state.momentDetail.spot.countryName,
                        city: state.momentDetail.spot.cityName,
                        location: state.momentDetail.spot.spotName,
                      ),
                      MomentContent(text: state.momentDetail.content),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text('${state.momentDetail.releaseDate}发布'),
                      ),
                      LikedUserLine(
                        urls: state.momentDetail.favUser,
                        favNum: state.momentDetail.favNum,
                      ),
                      BlocProvider<CommentCoverPoolBloc>(
                        create: (context) => getIt.get<CommentCoverPoolBloc>()..add(
                            LoadCommentCoverPool(
                                commentCovers: state.momentDetail.comments),
                          ),
                        child: CommentCoverPool(
                          serviceBusinessId: state.momentDetail.momentId,
                          authorNickname: state.momentDetail.nickname,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => getIt.get<ThumbupBloc>(),
                      ),
                      BlocProvider(
                        create: (context) => getIt.get<CollectBloc>(),
                      ),
                    ],
                    child: BottomActionPanel(
                      serviceBusinessId: state.momentDetail.momentId,
                      favNum: state.momentDetail.favNum,
                      starNum: state.momentDetail.starNum,
                      commentNum: state.momentDetail.commentNum,
                      isFav: state.momentDetail.isFav,
                      isStar: state.momentDetail.isCollect,
                    ),
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
