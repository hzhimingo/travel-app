import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Widget> _tabs = [
    Tab(text: '我的浏览'),
    Tab(text: '点过的赞'),
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
          '浏览历史',
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
              child: Text('浏览'),
            ),
          ),
          Container(
            child: Center(
              child: Text('点赞'),
            ),
          ),
        ],
      ),
    );
  }
}
