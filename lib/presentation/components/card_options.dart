import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel/core/constant/iconfont.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:travel/presentation/blocs/collect/collect_bloc.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/presentation/blocs/thumbup/thumbup_bloc.dart';
import 'package:travel/presentation/components/icon_with_number.dart';
import 'package:travel/route/routes.dart';

class CardOptions extends StatefulWidget {
  final int serviceBusinessId;
  final bool isStar;
  final bool isFav;
  final int starNum;
  final int favNum;
  final int commentNum;

  CardOptions({
    Key key,
    this.starNum,
    this.isFav,
    this.isStar,
    this.favNum,
    this.commentNum,
    this.serviceBusinessId,
  }) : super(key: key);

  @override
  _CardOptionsState createState() => _CardOptionsState();
}

class _CardOptionsState extends State<CardOptions> {
  bool isStar;
  bool isFav;
  int starNum;
  int favNum;
  int commentNum;
  AuthorizationBloc _authorizationBloc;
  CurrentUserBloc _currentUserBloc;

  @override
  void initState() {
    super.initState();
    isStar = widget.isStar;
    isFav = widget.isFav;
    starNum = widget.starNum;
    favNum = widget.favNum;
    commentNum = widget.commentNum;
    _authorizationBloc = BlocProvider.of<AuthorizationBloc>(context);
    _currentUserBloc = BlocProvider.of<CurrentUserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BlocListener<ThumbupBloc, ThumbupState>(
            listener: (context, state) {
              if (state is Thumbuped) {
                showToast("点赞成功");
                setState(() {
                  isFav = !isFav;
                  favNum = favNum + 1;
                });
              }
              if (state is UnThumbup) {
                showToast("成功取消点赞");
                setState(() {
                  isFav = !isFav;
                  favNum = favNum - 1;
                });
              }
              if (state is ThumbUpFailed) {
                showToast('点赞失败，请稍后再试');
              }
              if (state is CancelThumbUpFailed) {
                showToast('取消点赞失败，请稍后再试');
              }
            },
            child: InkResponse(
              onTap: () {
                if (_authorizationBloc.state is UnAuthorized) {
                  GlobalRoute.router.navigateTo(context, '/login');
                } else {
                  final currentState = _currentUserBloc.state;
                  if (currentState is CurrentUserLoaded) {
                    print(currentState.currentUser.userId);
                    if (isFav) {
                      context.bloc<ThumbupBloc>().add(CancelThumbUp(
                            userId: currentState.currentUser.userId,
                            serviceBusinessId: widget.serviceBusinessId,
                          ));
                    } else {
                      context.bloc<ThumbupBloc>().add(Thumbup(
                            userId: currentState.currentUser.userId,
                            serviceBusinessId: widget.serviceBusinessId,
                          ));
                    }
                  }
                }
              },
              child: IconWithNumber(
                icon: Icon(
                  IconData(
                    isFav ? IconFonts.like_fill : IconFonts.like,
                    fontFamily: 'IconFont',
                  ),
                  color: isFav ? Colors.redAccent : Colors.black,
                  size: 27.0,
                ),
                number: favNum,
              ),
            ),
          ),
          BlocListener<CollectBloc, CollectState>(
            listener: (context, state) {
              if (state is Collected) {
                showToast("收藏成功");
                setState(() {
                  isStar = !isStar;
                  starNum = starNum + 1;
                });
              }
              if (state is UnCollect) {
                showToast("取消收藏成功");
                setState(() {
                  isStar = !isStar;
                  starNum = starNum - 1;
                });
              }
              if (state is CollectFailed) {
                showToast('收藏失败，请稍后再试');
              }
              if (state is CancelThumbUpFailed) {
                showToast('取消收藏失败，请稍后再试');
              }
            },
            child: InkResponse(
              onTap: () {
                if (_authorizationBloc.state is UnAuthorized) {
                  GlobalRoute.router.navigateTo(context, '/login');
                } else {
                  final currentState = _currentUserBloc.state;
                  if (currentState is CurrentUserLoaded) {
                    if (isStar) {
                      context.bloc<CollectBloc>().add(
                            CancelCollect(
                              userId: currentState.currentUser.userId,
                              serviceBusinessId: widget.serviceBusinessId,
                            ),
                          );
                    } else {
                      context.bloc<CollectBloc>().add(
                            ActionCollect(
                              typeId: 1,
                              userId: currentState.currentUser.userId,
                              serviceBusinessId: widget.serviceBusinessId,
                            ),
                          );
                    }
                  }
                }
              },
              child: IconWithNumber(
                icon: Icon(
                  IconData(
                    isStar ? IconFonts.star_fill : IconFonts.star,
                    fontFamily: 'IconFont',
                  ),
                  size: 27.0,
                  color: isStar ? Colors.yellow : Colors.black,
                ),
                number: starNum,
              ),
            ),
          ),
          InkResponse(
            onTap: () {},
            child: IconWithNumber(
              icon: Icon(
                IconData(
                  IconFonts.comment,
                  fontFamily: 'IconFont',
                ),
                size: 27.0,
              ),
              number: commentNum,
            ),
          ),
          InkResponse(
            onTap: () {},
            child: Icon(
              IconData(IconFonts.share, fontFamily: 'IconFont'),
              size: 27.0,
            ),
          ),
        ],
      ),
    );
  }
}
