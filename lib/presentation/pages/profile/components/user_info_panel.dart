import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/route/routes.dart';

class UserInfoPanel extends StatelessWidget {
  const UserInfoPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<CurrentUserBloc, CurrentUserState>(
                  builder: (context, state) {
                    if (state is CurrentUserLoaded) {
                      return Text(
                        state.currentUser.nickname,
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          GlobalRoute.router.navigateTo(context, Routes.login);
                        },
                        child: Text(
                          '登录之后更精彩',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                  },
                ),
                BlocBuilder<CurrentUserBloc, CurrentUserState>(
                  builder: (context, state) {
                    if (state is CurrentUserLoaded) {
                      return _buildLevel(state.currentUser.level);
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
            BlocBuilder<CurrentUserBloc, CurrentUserState>(
              builder: (context, state) {
                if (state is CurrentUserLoaded) {
                  return _buildRowInfo(
                    state.currentUser.followNum,
                    state.currentUser.fansNum,
                    state.currentUser.visitedNum,
                  );
                } else {
                  return _buildRowInfo(0, 0, 0);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildLevel(int level) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 5.0),
      padding: EdgeInsets.only(
        top: 2.0,
        bottom: 2.0,
        left: 3.0,
        right: 3.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color.fromRGBO(70, 130, 255, 1.0),
      ),
      child: Text(
        'LV.$level',
        style: TextStyle(
          color: Colors.white,
          fontSize: 11.0,
        ),
      ),
    );
  }

  _buildRowInfo(int followNum, int fansNum, int vistiedNum) {
    return Row(
      children: <Widget>[
        _numberInfo(followNum, '关注'),
        _numberInfo(fansNum, '粉丝'),
        _numberInfo(vistiedNum, '来访'),
      ],
    );
  }

  _numberInfo(int num, String label) {
    return Container(
      margin: EdgeInsets.only(
        right: 15.0,
        top: 8.0,
      ),
      child: Row(
        children: <Widget>[
          Text(
            '$num',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
            ),
          )
        ],
      ),
    );
  }
}
