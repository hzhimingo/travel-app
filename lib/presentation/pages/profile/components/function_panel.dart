import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';
import 'package:travel/presentation/components/extended_icon.dart';

class FunctionPanel extends StatelessWidget {
  final List<_FunctionInfo> _info = [
    _FunctionInfo(
      route: '/collect',
      icon: Icon(
        Icons.star,
        color: Colors.orangeAccent,
      ),
      label: '收藏',
    ),
    _FunctionInfo(
      route: '/history',
      icon: Icon(
        Icons.query_builder,
        color: Colors.grey[500],
      ),
      label: '历史',
    ),
    _FunctionInfo(
      route: '/pictureAlbum',
      icon: Icon(Icons.image),
      label: '相册',
    ),
    _FunctionInfo(
      route: '/follow',
      icon: Icon(Icons.people),
      label: '关注',
    ),
    _FunctionInfo(
      route: '/follow',
      icon: Icon(Icons.edit),
      label: '创作',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              GlobalRoute.router.navigateTo(
                context,
                _info[index].route,
                transition: TransitionType.cupertino,
              );
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
