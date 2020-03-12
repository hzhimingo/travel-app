import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/moment_pool/moment_pool_bloc.dart';
import 'package:travel/presentation/pages/explore/tabviews/moment_tab_view.dart';

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
  double piexls = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    _controller = ScrollController()
      ..addListener(
        () {
          piexls = _controller.position.pixels;
        },
      );
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
            BlocProvider<MomentPoolBloc>(
              create: (context) =>
                  getIt.get<MomentPoolBloc>()..add(InitializeMomentPool()),
              child: MomentTabView(),
            ),
            BlocProvider<MomentPoolBloc>(
              create: (context) =>
                  getIt.get<MomentPoolBloc>()..add(InitializeMomentPool()),
              child: MomentTabView(),
            ),
          ],
        ),
      ),
    );
  }
}
