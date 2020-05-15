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
  final bool isFav;
  final bool isStar;
  final int favNum;
  final int starNum;
  final int commentNum;
  final int serviceBusinessId;

  BottomActionPanel({
    Key key,
    this.isFav,
    this.isStar,
    this.favNum,
    this.starNum,
    this.commentNum,
    this.serviceBusinessId,
  }) : super(key: key);

  @override
  _BottomActionPanelState createState() => _BottomActionPanelState();
}

class _BottomActionPanelState extends State<BottomActionPanel> {
  bool isFav;
  bool isStar;
  int favNum;
  int starNum;
  int commentNum;
  AuthorizationBloc _authorizationBloc;
  CurrentUserBloc _currentUserBloc;

  @override
  void initState() {
    super.initState();
    isFav = widget.isFav;
    isStar = widget.isStar;
    favNum = widget.favNum;
    starNum = widget.starNum;
    commentNum = widget.commentNum;
    _authorizationBloc = BlocProvider.of<AuthorizationBloc>(context);
    _currentUserBloc = BlocProvider.of<CurrentUserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: IconWithNumber(
              icon: Icon(
                Icons.comment,
                size: 28.0,
              ),
              number: commentNum,
            ),
          ),
          BlocListener<ThumbupBloc, ThumbupState>(
            listener: (context, state) {
              if (state is Thumbuped) {
                setState(() {
                  isFav = !isFav;
                  favNum = favNum + 1;
                });
              }
              if (state is UnThumbup) {
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
                setState(() {
                  isStar = !isStar;
                  starNum = starNum + 1;
                });
              }
              if (state is UnCollect) {
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
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 300.0,
                    color: Colors.white,
                  );
                },
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: 110.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Text(
                '文中提及',
                style: TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
