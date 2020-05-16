import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:travel/presentation/blocs/collect/collect_bloc.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/presentation/blocs/thumbup/thumbup_bloc.dart';
import 'package:travel/presentation/components/icon_with_number.dart';
import 'package:travel/route/routes.dart';

class BottomActionPanel extends StatefulWidget {
  final int serviceBusinessId;
  final int favNum;
  final int starNum;
  final int commentNum;
  final bool isFav;
  final bool isStar;
  BottomActionPanel({
    Key key,
    this.favNum,
    this.isFav,
    this.starNum,
    this.commentNum,
    this.isStar,
    this.serviceBusinessId,
  }) : super(key: key);

  @override
  _BottomActionPanelState createState() => _BottomActionPanelState();
}

class _BottomActionPanelState extends State<BottomActionPanel> {
  int favNum = 0;
  int starNum = 0;
  int commentNum = 0;
  bool isFav = false;
  bool isStar = false;
  AuthorizationBloc _authorizationBloc;
  CurrentUserBloc _currentUserBloc;

  @override
  void initState() {
    super.initState();
    this.favNum = widget.favNum;
    this.starNum = widget.starNum;
    this.commentNum = widget.commentNum;
    this.isStar = widget.isStar;
    this.isFav = widget.isFav;
    _authorizationBloc = BlocProvider.of<AuthorizationBloc>(context);
    _currentUserBloc = BlocProvider.of<CurrentUserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 2.0,
          spreadRadius: 2.0,
          offset: Offset.zero,
        )
      ]),
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
                showToast("取消点赞成功");
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
            child: GestureDetector(
              onTap: () {
                if (_authorizationBloc.state is UnAuthorized) {
                  GlobalRoute.router.navigateTo(context, '/login');
                } else {
                  final currentState = _currentUserBloc.state;
                  if (currentState is CurrentUserLoaded) {
                    print(currentState.currentUser.userId);
                    if (isFav) {
                      context.bloc<ThumbupBloc>().add(
                            CancelThumbUp(
                              userId: currentState.currentUser.userId,
                              serviceBusinessId: widget.serviceBusinessId,
                            ),
                          );
                    } else {
                      context.bloc<ThumbupBloc>().add(
                            Thumbup(
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
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.redAccent : Colors.black,
                  size: 28.0,
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
            child: GestureDetector(
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
                  isStar ? Icons.star : Icons.star_border,
                  color: isStar ? Colors.yellow : Colors.black,
                  size: 28.0,
                ),
                number: starNum,
              ),
            ),
          ),
          IconWithNumber(
            icon: Icon(Icons.comment),
            number: commentNum,
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
