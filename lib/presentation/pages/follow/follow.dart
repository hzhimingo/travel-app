import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class Follow extends StatefulWidget {
  Follow({Key key}) : super(key: key);

  @override
  _FollowState createState() => _FollowState();
}

class _FollowState extends State<Follow> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Widget> _tabs = [
    Tab(text: '我的关注'),
    Tab(text: '我的粉丝'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          '关注',
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
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => _FollowFansLine(),
          ),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => _FollowFansLine(),
          ),
        ],
      ),
    );
  }
}

class _FollowFansLine extends StatelessWidget {
  final int userId;
  final String avatar;
  final String nickname;
  final String description;

  const _FollowFansLine({
    Key key,
    this.userId,
    this.avatar,
    this.nickname,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 12.0,
          bottom: 12.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[100],
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: ExtendedNetworkImageProvider(
                'https://p1-q.mafengwo.net/s15/M00/96/01/CoUBGV4pHj6AdsKGAADkQCnAbQE62.jpeg',
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '飞翔的猪',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '一无所知',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 60.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                '已关注',
                style: TextStyle(
                  fontSize: 13.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
