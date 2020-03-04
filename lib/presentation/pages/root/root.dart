import 'package:flutter/material.dart';
import 'package:travel/core/constant/iconfont.dart';
import 'package:travel/presentation/pages/explore/explore.dart';
import 'package:travel/presentation/pages/home/home.dart';
import 'package:travel/presentation/pages/pop/pop.dart';
import 'package:travel/presentation/pages/profile/profile.dart';
import 'package:travel/presentation/pages/stroke/stroke.dart';

import './components/components.dart';

class Root extends StatelessWidget {
  
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
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
          _controller.jumpToPage(index);
        },
        activeColor: Theme.of(context).primaryColor,
        center: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return Pop();
                },
              ),
            );
          },
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
