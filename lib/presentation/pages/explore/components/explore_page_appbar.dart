import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class ExploreAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  final TabController controller;

  const ExploreAppBar({this.tabs, this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 5.0,
          bottom: 5.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 0.4,
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                GlobalRoute.router.navigateTo(
                  context,
                  Routes.search,
                  transition: TransitionType.cupertino,
                );
              },
              child: Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 20.0),
                    Icon(
                      Icons.search,
                      color: Colors.black26,
                      size: 20.0,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      '三亚',
                      style: TextStyle(color: Colors.black26, fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              width: double.infinity,
              height: 35.0,
              child: TabBar(
                labelColor: Color.fromRGBO(70, 130, 255, 1.0),
                unselectedLabelColor: Colors.black38,
                // isScrollable: true,
                labelStyle: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.0,
                ),
                indicatorWeight: 3.0,
                indicatorColor: Color.fromRGBO(70, 130, 255, 1.0),
                indicatorSize: TabBarIndicatorSize.label,
                controller: controller,
                tabs: tabs,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90.0);
}
