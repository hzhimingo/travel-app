import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel/core/platform/custom_behavior.dart';
import 'package:travel/presentation/blocs/topic_pool/topic_pool_bloc.dart';
import 'package:travel/presentation/components/shimmer/topic_pool_shimmer.dart';

import 'topic_cover_card.dart';

class TopicCoverCardPool extends StatefulWidget {
  final Key tabKey;
  TopicCoverCardPool({Key key, this.tabKey}) : super(key: key);

  @override
  _TopicCoverCardPoolState createState() => _TopicCoverCardPoolState();
}

class _TopicCoverCardPoolState extends State<TopicCoverCardPool>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  TopicPoolBloc _poolBloc;

  @override
  void initState() {
    super.initState();
    _poolBloc = BlocProvider.of<TopicPoolBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<TopicPoolBloc, TopicPoolState>(
      listener: (context, state) {},
      buildWhen: (previous, current) {
        if (current is TopicPoolLoadFailure || current is TopicPoolLoading) {
          return false;
        } else {
          return true;
        }
      },
      //ignore: missing_return
      builder: (context, state) {
        if (state is TopicPoolInitializing) {
          return TopicPoolShimmer();
        }
        if (state is TopicPoolEmpty) {
          return Center(
            child: Text('加载失败!'),
          );
        }
        if (state is TopicPoolLoaded) {
          return NotificationListener<OverscrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels != 0) {
                context.bloc<TopicPoolBloc>().add(LoadMoreTopicCovers());
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: ScrollConfiguration(
                behavior: CutsomBehavior(),
                child: ListView.builder(
                  itemCount: state.topicCovers.length,
                  itemBuilder: (context, index) => TopicCoverCard(
                    topicCover: state.topicCovers[index],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }
}
