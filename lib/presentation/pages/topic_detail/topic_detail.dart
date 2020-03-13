import 'package:flutter/material.dart';
import 'package:travel/presentation/components/moment_cover_pool.dart';
import './components/components.dart';

class TopicDetail extends StatefulWidget {
  TopicDetail({Key key}) : super(key: key);

  @override
  _TopicDetailState createState() => _TopicDetailState();
}

class _TopicDetailState extends State<TopicDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            TopicDetailPanel(
              scrollController: _controller,
              controller: _tabController,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            MomentCoverPool(),
            MomentCoverPool(),
          ],
        ),
      ),
    );
  }
}
