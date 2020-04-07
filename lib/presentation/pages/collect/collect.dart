import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class Collect extends StatefulWidget {
  Collect({Key key}) : super(key: key);

  @override
  _CollectState createState() => _CollectState();
}

class _CollectState extends State<Collect> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Widget> _tabs = [
    Tab(text: '瞬间'),
    Tab(text: '游记'),
    Tab(text: '问题'),
    Tab(text: '回答'),
    Tab(text: '地点'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            GlobalRoute.router.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          '我的收藏',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            child: TabBar(
              tabs: _tabs,
              controller: _tabController,
              labelColor: Color.fromRGBO(70, 130, 255, 1.0),
              unselectedLabelColor: Colors.black38,
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
            ),
          ),
          preferredSize: Size.fromHeight(35.0),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            child: Center(
              child: Text('瞬间'),
            ),
          ),
          Container(
            child: Center(
              child: Text('游记'),
            ),
          ),
          Container(
            child: Center(
              child: Text('问题'),
            ),
          ),
          Container(
            child: Center(
              child: Text('回答'),
            ),
          ),
          Container(
            child: Center(
              child: Text('地点'),
            ),
          ),
        ],
      ),
    );
  }
}
