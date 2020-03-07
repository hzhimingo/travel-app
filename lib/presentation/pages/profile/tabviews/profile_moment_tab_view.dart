import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class ProfileMomentTabView extends StatelessWidget {
  const ProfileMomentTabView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('登录'),
          onPressed: () {
            GlobalRoute.router.navigateTo(context, Routes.login);
          },
        ),
      ),
    );
  }
}
