import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/core/constant/iconfont.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/route/routes.dart';

class AvatarFollowPanel extends StatelessWidget {
  final double backgroundHeight;
  final double infoPanelHeight;
  final double offset;
  final avatarRadius;

  const AvatarFollowPanel({
    Key key,
    double backgroundHeight,
    double infoPanelHeight,
    double offset,
    double avatarRadius,
  })  : backgroundHeight = backgroundHeight ?? 300.0,
        infoPanelHeight = infoPanelHeight ?? 60.0,
        offset = offset ?? 20.0,
        avatarRadius = avatarRadius ?? 80.0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.notifications_active,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            GlobalRoute.router.navigateTo(context, Routes.settings);
          },
        ),
      ],
      brightness: Brightness.dark,
      elevation: 0.0,
      pinned: true,
      expandedHeight: backgroundHeight +
          infoPanelHeight -
          offset -
          MediaQuery.of(context).padding.top,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Container(
          width: MediaQuery.of(context).size.width,
          height: backgroundHeight,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0.0,
                top: 0.0,
                width: MediaQuery.of(context).size.width,
                height: backgroundHeight,
                child: BlocBuilder<CurrentUserBloc, CurrentUserState>(
                  builder: (context, state) {
                    if (state is CurrentUserLoaded) {
                      //简化成小组件
                      return _buildBackground(
                        state.currentUser.background,
                        context,
                      );
                    } else {
                      return _buildBackground(
                        'https://travel-1257167414.cos.ap-shanghai.myqcloud.com/arthur-yeti-g9NpJ2odSYo-unsplash.jpg',
                        context,
                      );
                    }
                  },
                ),
              ),
              Positioned(
                left: 0.0,
                top: backgroundHeight - offset,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: infoPanelHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: backgroundHeight - offset - avatarRadius / 2,
                left: 25.0,
                width: avatarRadius,
                height: avatarRadius,
                child: Material(
                  borderRadius: BorderRadius.circular(avatarRadius),
                  elevation: 10.0,
                  child: BlocBuilder<CurrentUserBloc, CurrentUserState>(
                    builder: (context, state) {
                      if (state is CurrentUserLoaded) {
                        return _buildCircleAvatar(
                          avatarRadius,
                          state.currentUser.avatar,
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            GlobalRoute.router.navigateTo(context, Routes.login);
                          },
                          child: _buildCircleAvatar(
                            avatarRadius,
                            'https://assets.leetcode-cn.com/aliyun-lc-upload/default_avatar.png',
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCircleAvatar(double radius, String avatar) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: ExtendedNetworkImageProvider(
        avatar,
        cache: true,
      ),
    );
  }

  _buildBackground(String background, BuildContext context) {
    return ExtendedImage.network(
      background,
      width: MediaQuery.of(context).size.width,
      height: backgroundHeight,
      cache: true,
      fit: BoxFit.fill,
    );
  }
}
