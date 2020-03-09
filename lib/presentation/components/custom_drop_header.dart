import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomDropHeader extends StatelessWidget {
  const CustomDropHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      builder: (context, mode) {
        Widget body;
        if (mode == RefreshStatus.idle) {
          body = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.arrow_downward, color: Colors.blue, size: 20.0,),
              SizedBox(width: 5.0),
              Text("下拉刷新"),
            ],
          );
        } else if (mode == RefreshStatus.refreshing) {
          body = SpinKitDoubleBounce(
            color: Colors.blue,
            size: 10.0,
          );
        } else if (mode == RefreshStatus.failed) {
          body = Text("加载失败!");
        } else if (mode == RefreshStatus.canRefresh) {
          body = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.arrow_upward, color: Colors.blue, size: 20.0,),
              SizedBox(width: 5.0),
              Text("释放刷新"),
            ],
          );
        } else {
          body = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.check, color: Colors.blue, size: 20.0,),
              SizedBox(width: 5.0),
              Text('刷新成功'),
            ],
          );
        }
        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}
