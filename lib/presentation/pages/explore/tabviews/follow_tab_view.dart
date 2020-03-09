import 'package:flutter/material.dart';

import '../components/components.dart';

class FollowTabView extends StatefulWidget {
  FollowTabView({Key key}) : super(key: key);

  @override
  _FollowTabViewState createState() => _FollowTabViewState();
}

class _FollowTabViewState extends State<FollowTabView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: _buildListViewItem,
      ),
    );
  }

  Widget _buildListViewItem(BuildContext context, int index) {
    return FollowArticle();
  }
}
