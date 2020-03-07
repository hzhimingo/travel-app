import 'package:flutter/material.dart';

class SliverPersistentTabBar extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabs;

  const SliverPersistentTabBar({
    Key key,
    @required this.controller,
    @required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverPersistentTabBarDelegate(
        height: 45.0,
        child: Container(
          width: double.infinity,
          height: 45.0,
          color: Colors.white,
          child: TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontSize: 15.0,
            ),
            indicator: UnderlineTabIndicator(
              borderSide:
                  BorderSide(width: 3.0, color: Theme.of(context).primaryColor),
            ),
            indicatorSize: TabBarIndicatorSize.label,
            controller: controller,
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}

class _SliverPersistentTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _SliverPersistentTabBarDelegate({this.child, this.height});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return this != oldDelegate;
  }
}
