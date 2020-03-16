import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/topic_detail/topic_detail_bloc.dart';
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
      body: BlocBuilder<TopicDetailBloc, TopicDetailState>(
        builder: (context, state) {
          if (state is TopicDetailLoading) {
            return Center(
              child: Text('Loading....'),
            );
          } else if (state is TopicDetailLoaded) {
            return NestedScrollView(
              controller: _controller,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  TopicDetailPanel(
                    scrollController: _controller,
                    controller: _tabController,
                    topicDetail: state.topicDetail,
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
            );
          } else {
            return Center(
              child: Text('Failure....'),
            );
          }
        },
      ),
    );
  }
}
