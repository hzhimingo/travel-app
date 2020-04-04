import 'package:flutter/material.dart';

class HotSearchPanel extends StatelessWidget {
  final List<String> hot = [
    '踏青攻略',
    '五月去哪',
    '三亚',
    '桂林',
    '无锡',
    '南京',
    '黄山',
    '千岛湖',
    '九寨沟',
    '波黑',
  ];
  HotSearchPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '热门搜索',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 5,
            ),
            itemBuilder: _buildGridItem,
          )
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      //color: Colors.yellow,
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}',
            style: TextStyle(
              fontSize: 15.0,
              color: _buildTextColor(index),
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(width: 15.0),
          Expanded(
            child: Text(
              hot[index],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildTextColor(int index) {
    if (index == 0) {
      return Colors.redAccent;
    } else if (index == 1) {
      return Colors.orangeAccent;
    } else if (index == 2) {
      return Colors.yellowAccent;
    } else {
      return Colors.grey;
    }
  }
}
