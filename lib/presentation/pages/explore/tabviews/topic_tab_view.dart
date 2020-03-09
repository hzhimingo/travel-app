import 'package:flutter/material.dart';
import 'package:travel/core/constant/iconfont.dart';
import 'package:extended_image/extended_image.dart';

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
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: HotTopic(),
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
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            TopicGroup(),
            TopicGroup(),
            TopicGroup(),
            TopicGroup(),
            TopicGroup(),
            TopicGroup(),
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

///热门话题
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
      child: Row(
        children: <Widget>[
          ExtendedImage.network(
            'https://www.bigstockphoto.com/images/homepage/module-6.jpg',
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
                _topLine(index * 3 + 1, '武汉加油'),
                _topLine(index * 3 + 2, '大家一起云旅行'),
                _topLine(index * 3 + 3, '新型肺炎防御攻略'),
              ],
            ),
          ),
        ],
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

class TopicGroup extends StatefulWidget {
  TopicGroup({Key key}) : super(key: key);

  @override
  _TopicGroupState createState() => _TopicGroupState();
}

class _TopicGroupState extends State<TopicGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => TopicCard(),
      ),
    );
  }
}

class TopicCard extends StatelessWidget {
  const TopicCard({Key key}) : super(key: key);

  final String url1 =
      'https://p1-q.mafengwo.net/s15/M00/1F/92/CoUBGV5CEcKARp2TAAHCIyRVBQc06.jpeg?imageMogr2%2Fthumbnail%2F%21600x600r%2Fstrip%2Fquality%2F90';
  final String url2 =
      'https://b1-q.mafengwo.net/s15/M00/F1/3C/CoUBGV5BlfiAQ1cjAB15D4Ts6Zk363.jpg?imageMogr2%2Fthumbnail%2F%21600x600r%2Fstrip%2Fquality%2F90';
  final String url3 =
      'https://p1-q.mafengwo.net/s15/M00/0D/63/CoUBGV5B9iqADjioABbaVdX2ZY4752.jpg?imageMogr2%2Fthumbnail%2F%21600x600r%2Fstrip%2Fquality%2F90';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        width: double.infinity,
        height: ((MediaQuery.of(context).size.width - 50.0) / 3) + 105.0,
        child: Column(
          children: <Widget>[
            Container(
              height: 45.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        IconData(
                          IconFonts.sharp,
                          fontFamily: 'IconFont',
                        ),
                        color: Theme.of(context).primaryColor,
                        size: 20.0,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '大家一起云旅行',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                          children: [
                            TextSpan(
                              text: '2.3k',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: '瞬间·'),
                            TextSpan(
                              text: '4.1k',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: '人热议中'),
                          ],
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                _showItem(url1, '参观中共松浦特委机关旧址陈列馆', context),
                SizedBox(width: 10.0),
                _showItem(url2, '参观中共松浦特委机关旧址陈列馆', context),
                SizedBox(width: 10.0),
                _showItem(url3, '参观中共松浦特委机关旧址陈列馆', context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showItem(String imageUrl, String text, BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 50.0) / 3,
      height: ((MediaQuery.of(context).size.width - 50.0) / 3) + 60.0,
      child: Column(
        children: <Widget>[
          ExtendedImage.network(
            url1,
            cache: true,
            fit: BoxFit.cover,
            width: (MediaQuery.of(context).size.width - 50.0) / 3,
            height: (MediaQuery.of(context).size.width - 50.0) / 3,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 50.0,
            child: Text(
              '参观中共松浦特委机关旧址陈列馆',
              style: TextStyle(
                fontSize: 15.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
