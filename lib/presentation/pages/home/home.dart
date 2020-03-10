import 'package:flutter/material.dart';
import 'package:travel/presentation/components/shimmer/topic_pool_shimmer.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: TopicPoolShimmer(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
