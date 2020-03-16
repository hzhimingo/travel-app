import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:travel/entity/topic_detail.dart';
import 'package:travel/route/routes.dart';

class TopicDetailPanel extends StatefulWidget {
  final TopicDetail topicDetail;
  final TabController controller;
  final ScrollController scrollController;

  TopicDetailPanel({
    Key key,
    this.controller,
    this.scrollController,
    this.topicDetail,
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
          widget.topicDetail.name,
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.black,
          ),
        ),
      ),
      expandedHeight: 280.0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: 60.0,
              left: 15.0,
              right: 15.0,
              top: 90.0,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExtendedNetworkImageProvider(
                  widget.topicDetail.background.url,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '#${widget.topicDetail.name}',
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
                  '${widget.topicDetail.visitedNum}浏览·${widget.topicDetail.momentNum}瞬间',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.topicDetail.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
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
