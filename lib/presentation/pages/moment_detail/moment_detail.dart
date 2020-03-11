import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:travel/entity/picture.dart';
import 'package:extended_image/extended_image.dart';
import 'package:travel/presentation/blocs/moment_detail/moment_detail_bloc.dart';
import 'package:travel/route/routes.dart';
import './components/components.dart';

class MomentDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0.3,
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
                    backgroundImage: ExtendedNetworkImageProvider(state.momentDetail.avatar),
                  );
                } else {
                  return CircleAvatar(
                    radius: 22.0,
                    backgroundImage: ExtendedNetworkImageProvider(
                      'https://travel-1257167414.cos.ap-shanghai.myqcloud.com/avatar.jpg',
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
                      color: Colors.black,
                      fontSize: 17.0,
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
            onPressed: null,
          ),
        ],
      ),
      body: BlocBuilder<MomentDetailBloc, MomentDetailState>(
        //ignore: missing_return
        builder: (context, state) {
          if (state is MomentDetailEmpty) {
            return Center(
              child: SpinKitThreeBounce(
                color: Theme.of(context).primaryColor,
                size: 33.0,
              ),
            );
          }
          if (state is MomentDetailFaliure) {
            return Center(
              child: Text('Failure......'),
            );
          }
          if (state is MomentDetailLoaded) {
            return ListView(
              children: <Widget>[
                MomentPictureDisplay(
                  pictures: state.momentDetail.pictures,
                ),
                MomentContent(
                  text: state.momentDetail.content,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 10.0,
                  ),
                  child: Text(
                    '${state.momentDetail.releaseDate} 发布',
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Divider(
                  color: Colors.grey[200],
                ),
                MentionSpot(
                  spot: state.momentDetail.spot,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 10.0,
                  ),
                  child: Text(
                    '拍摄于${state.momentDetail.takeDate}',
                    style: TextStyle(color: Colors.black38, fontSize: 15.0),
                  ),
                ),
                Container(
                  height: 400.0,
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<MomentDetailBloc, MomentDetailState>(
        builder: (context, state) {
          if (state is MomentDetailLoaded) {
            return BottomActionPanel(
              isFav: false,
              isStar: false,
              commentNum: state.momentDetail.commentNum,
              starNum: state.momentDetail.starNum,
              favNum: state.momentDetail.favNum,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
