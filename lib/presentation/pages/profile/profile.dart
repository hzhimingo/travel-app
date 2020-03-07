import 'package:flutter/material.dart';

import './components/components.dart';
import './tabviews/tabviews.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Widget> _tabs = [
    Tab(text: '瞬间'),
    Tab(text: '游记'),
    Tab(text: '视频'),
    Tab(text: '问题'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          print('$innerBoxIsScrolled');
          return <Widget>[
            // AvatarFollowPanel(),
            // UserInfoPanel(),
            FunctionPanel(),
            SliverPersistentTabBar(
              controller: _tabController,
              tabs: _tabs,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ProfileMomentTabView(),
            ProfileTravelNoteTabView(),
            ProfileVideoTabView(),
            ProfileQuestionTabView(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
