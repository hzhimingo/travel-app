import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/core/constant/iconfont.dart';
import 'package:travel/route/routes.dart';
import 'package:travel/presentation/pages/explore/explore.dart';
import 'package:travel/presentation/pages/home/home.dart';
import 'package:travel/presentation/pages/profile/profile.dart';
import 'package:travel/presentation/pages/stroke/stroke.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';

import './components/components.dart';

class Root extends StatelessWidget {
  
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final AuthorizationBloc _authoriztionBloc = BlocProvider.of<AuthorizationBloc>(context);
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Home(),
          Explore(),
          Stroke(),
          Profile(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (index) {
          //在此判断是否已经授权登录
          if (index == 3 && _authoriztionBloc.state is UnAuthorized) {
            GlobalRoute.router.navigateTo(context, '/login').then((value) {
              if (_authoriztionBloc.state is UnAuthorized) {
                //doNoting
              } else {
                _controller.jumpToPage(index);
              }
            });
          } else {
            _controller.jumpToPage(index);
          }
        },
        activeColor: Theme.of(context).primaryColor,
        center: GestureDetector(
          onTap: () => GlobalRoute.router.navigateTo(context, '/pop'),
          child: Container(
            width: 42.0,
            height: 32.0,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 25.0,
            ),
          ),
        ),
        items: [
          CustomBottomNavigationBarItem(
            icon: IconData(IconFonts.home, fontFamily: 'IconFont'),
            activeIcon: IconData(IconFonts.home_fill, fontFamily: 'IconFont'),
            label: '首页',
          ),
          CustomBottomNavigationBarItem(
            icon: IconData(IconFonts.explore, fontFamily: 'IconFont'),
            activeIcon: IconData(IconFonts.explore_fill, fontFamily: 'IconFont'),
            label: '探索',
          ),
          CustomBottomNavigationBarItem(
            icon: IconData(IconFonts.bag, fontFamily: 'IconFont'),
            activeIcon: IconData(IconFonts.bag_fill, fontFamily: 'IconFont'),
            label: '出行',
          ),
          CustomBottomNavigationBarItem(
            icon: IconData(IconFonts.people, fontFamily: 'IconFont'),
            activeIcon: IconData(IconFonts.people_fill, fontFamily: 'IconFont'),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
