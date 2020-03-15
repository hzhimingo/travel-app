import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/hot_topic/hot_topic_bloc.dart';
import 'package:travel/presentation/blocs/topic_pool/topic_pool_bloc.dart';

import '../components/components.dart';

class TopicTabView extends StatefulWidget {
  TopicTabView({Key key}) : super(key: key);

  @override
  _TopicTabViewState createState() => _TopicTabViewState();
}

class _TopicTabViewState extends State<TopicTabView>
    with SingleTickerProviderStateMixin {
  final List<Widget> _tabs = [
    Tab(text: '推荐'),
    Tab(text: '本周热门'),
    Tab(text: '景点'),
    Tab(text: '住宿'),
    Tab(text: '购物'),
    Tab(text: '美食'),
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: false,
              expandedHeight: 240.0,
              flexibleSpace: BlocProvider<HotTopicBloc>(
                create: (context) =>
                    getIt.get<HotTopicBloc>()..add(FetchHotTopic()),
                child: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: HotTopic(),
                ),
              ),
              bottom: TabBar(
                tabs: _tabs,
                controller: _tabController,
                labelColor: Color.fromRGBO(70, 130, 255, 1.0),
                unselectedLabelColor: Colors.black38,
                isScrollable: true,
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.0,
                ),
                indicatorWeight: 3.0,
                indicatorColor: Color.fromRGBO(70, 130, 255, 1.0),
                indicatorSize: TabBarIndicatorSize.label,
              ),
            )
          ];
        },
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: <Widget>[
            BlocProvider(
              create: (context) =>
                  getIt.get<TopicPoolBloc>()..add(InitializeTopicPool()),
              child: TopicCoverCardPool(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt.get<TopicPoolBloc>()..add(InitializeTopicPool()),
              child: TopicCoverCardPool(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt.get<TopicPoolBloc>()..add(InitializeTopicPool()),
              child: TopicCoverCardPool(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt.get<TopicPoolBloc>()..add(InitializeTopicPool()),
              child: TopicCoverCardPool(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt.get<TopicPoolBloc>()..add(InitializeTopicPool()),
              child: TopicCoverCardPool(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt.get<TopicPoolBloc>()..add(InitializeTopicPool()),
              child: TopicCoverCardPool(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
