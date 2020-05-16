import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class CitySelector extends StatefulWidget {
  CitySelector({Key key}) : super(key: key);

  @override
  _CitySelectorState createState() => _CitySelectorState();
}

class _CitySelectorState extends State<CitySelector> {
  int currentIndex = 0;
  final List<String> leftItem = [
    '热门',
    '中国',
    '亚洲',
    '欧洲',
    '北美洲',
    '大洋洲',
    '南美洲',
    '非洲',
    '南极洲',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            GlobalRoute.router.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          '目的地切换',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 10.0,
              bottom: 10.0,
            ),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color.fromRGBO(246, 247, 249, 1.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.black38,
                    size: 18.0,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '搜索目的地',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(50.0),
        ),
      ),
      body: CitySelectorBody(
        left: CitySelectorLeft(
          tabs: leftItem,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
        ),
        right: CitySelectorRight(
          currentIndex: currentIndex,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'GPS定位',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SingleCityItem(city: '深圳'),
                      ],
                    ),
                  ),
                  RaisedButton(
                    child: Text('获取定位'),
                    onPressed: () async {
                      // final location = await AmapLocation.fetchLocation();
                      // print(location.city);
                    },
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SingleCityItem(city: '北京'),
                      SingleCityItem(city: '上海'),
                      SingleCityItem(city: '广州')
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SingleCityItem(city: '三亚'),
                      SingleCityItem(city: '重庆'),
                      SingleCityItem(city: '成都')
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SingleCityItem(city: '云南'),
                      SingleCityItem(city: '杭州'),
                      SingleCityItem(city: '西安')
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: <Widget>[
                      SingleCityItem(city: '南京'),
                    ],
                  ),
                ],
              ),
            ),
            RegionPool(),
            Container(
              child: Center(
                child: Text('暂无数据'),
              ),
            ),
            Container(
              child: Center(
                child: Text('暂无数据'),
              ),
            ),
            Container(
              child: Center(
                child: Text('暂无数据'),
              ),
            ),
            Container(
              child: Center(
                child: Text('暂无数据'),
              ),
            ),
            Container(
              child: Center(
                child: Text('暂无数据'),
              ),
            ),
            Container(
              child: Center(
                child: Text('暂无数据'),
              ),
            ),
            Container(
              child: Center(
                child: Text('暂无数据'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CitySelectorBody extends StatelessWidget {
  final Widget left;
  final Widget right;
  const CitySelectorBody({
    Key key,
    @required this.left,
    @required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[left, right],
      ),
    );
  }
}
