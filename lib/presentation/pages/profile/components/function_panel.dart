import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';
import 'package:travel/presentation/components/extended_icon.dart';

class FunctionPanel extends StatelessWidget {
  final List<_FunctionInfo> _info = [
    _FunctionInfo(route: '/', icon: Icon(Icons.star), label: '收藏'),
    _FunctionInfo(route: '/', icon: Icon(Icons.query_builder), label: '历史'),
    _FunctionInfo(route: '/', icon: Icon(Icons.verified_user), label: '收藏'),
    _FunctionInfo(route: '/', icon: Icon(Icons.access_alarms), label: '关注'),
    _FunctionInfo(route: '/', icon: Icon(Icons.markunread), label: '计划'),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              //Routes.sailor.navigate(_info[index].route);
            },
            child: ExtendedIcon(
              icon: _info[index].icon,
              text: Text(_info[index].label),
            ),
          );
        },
        childCount: 5,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
    );
  }
}

class _FunctionInfo {
  final String route;
  final Icon icon;
  final String label;

  _FunctionInfo({this.route, this.icon, this.label});
}
