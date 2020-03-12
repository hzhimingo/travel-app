import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:travel/route/routes.dart';

class TopicDetailPanel extends StatefulWidget {
  final TabController controller;
  final ScrollController scrollController;
  TopicDetailPanel({
    Key key,
    this.controller,
    this.scrollController,
  }) : super(key: key);

  @override
  _TopicDetailPanelState createState() => _TopicDetailPanelState();
}

class _TopicDetailPanelState extends State<TopicDetailPanel> {

  bool active = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      setState(() {
        if (widget.scrollController.position.pixels > 200.0) {
          active = true;
        } else {
          active = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      brightness: Brightness.light,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: active ? Colors.black : Colors.white,
        ),
        onPressed: () => GlobalRoute.router.pop(context),
      ),
      centerTitle: true,
      title: Offstage(
        offstage: !active,
        child: Text(
          '一起云赏樱',
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.black,
          ),
        ),
      ),
      expandedHeight: 280.0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Container(
          padding: EdgeInsets.only(
            bottom: 60.0,
            left: 15.0,
            right: 15.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: ExtendedNetworkImageProvider(
                'https://p1-q.mafengwo.net/s14/M00/79/C4/wKgE2l04J2GAFA_FAAnU7pkaTz0037.jpg',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '#一起云赏樱',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '61012浏览·438瞬间',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '今年最流行的踏春方式，足不出户云赏樱，不负好春光，来欣赏这短暂又美好的樱花季吧~',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black12,
                ),
              ),
            ),
            child: TabBar(
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
              controller: widget.controller,
              tabs: [
                Tab(text: '推荐'),
                Tab(text: '最新'),
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(50.0),
      ),
    );
  }
}
