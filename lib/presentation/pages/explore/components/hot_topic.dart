import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel/presentation/blocs/hot_topic/hot_topic_bloc.dart';
import 'package:travel/presentation/components/shimmer/hot_topic_shimmer.dart';

class HotTopic extends StatefulWidget {
  HotTopic({Key key}) : super(key: key);

  @override
  _HotTopicState createState() => _HotTopicState();
}

class _HotTopicState extends State<HotTopic> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '今日热门话题',
                style: TextStyle(
                  fontSize: 23.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  var currentOffset = _controller.offset;
                  var nextOffset = 0.0;
                  if (currentOffset != 240.0) {
                    nextOffset = currentOffset + 120.0;
                  } else {
                    nextOffset = 0.0;
                  }
                  _controller.animateTo(nextOffset,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease);
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.autorenew),
                    Text('换一换'),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120.0,
            margin: EdgeInsets.only(top: 15.0),
            child: ListView.builder(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: _singleHotTopicLine,
            ),
          ),
        ],
      ),
    );
  }

  Widget _singleHotTopicLine(BuildContext context, int index) {
    return Container(
      child: BlocBuilder<HotTopicBloc, HotTopicState>(
        builder: (context, state) {
          if (state is HotTopicLoaded) {
            return Row(
              children: <Widget>[
                ExtendedImage.network(
                  state.topicCovers[index * 3].coverImage.url,
                  cache: true,
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 160.0,
                  height: 120.0,
                  child: Column(
                    children: <Widget>[
                      _topLine(
                          index * 3 + 1, state.topicCovers[index * 3].name),
                      _topLine(
                          index * 3 + 2, state.topicCovers[index * 3 + 1].name),
                      _topLine(
                          index * 3 + 3, state.topicCovers[index * 3 + 2].name),
                    ],
                  ),
                ),
              ],
            );
          }
          if (state is HotTopicLoading || state is HotTopicEmpty) {
            return HotTopicShimmer();
          }
        },
      ),
    );
  }

  _topLine(int index, String text) {
    return Container(
      width: double.infinity,
      height: 40.0,
      margin: EdgeInsets.only(left: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ExtendedImage.asset(
            'assets/images/number$index.png',
            width: 30.0,
            height: 30.0,
          ),
          SizedBox(width: 8.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
