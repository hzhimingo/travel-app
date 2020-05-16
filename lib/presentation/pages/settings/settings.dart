import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel/core/platform/custom_behavior.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final AuthorizationBloc _authorizationBloc =
        BlocProvider.of<AuthorizationBloc>(context);
    //ignore: close_sinks
    final CurrentUserBloc _currentUserBloc =
        BlocProvider.of<CurrentUserBloc>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 247, 249, 1.0),
      appBar: AppBar(
        elevation: 0.8,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => GlobalRoute.router.pop(context),
        ),
        centerTitle: true,
        title: Text(
          '设置',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: CutsomBehavior(),
        child: ListView(
          children: <Widget>[
            Offstage(
              offstage: _authorizationBloc.state is UnAuthorized,
              child: Column(
                children: <Widget>[
                  SettingLine.defaultLine(
                    leaingText: '编辑个人信息',
                    onPressed: () {},
                  ),
                  SettingLine.defaultLine(
                    leaingText: '账号绑定与设置',
                    onPressed: () {},
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
            SettingLine.defaultLine(
              leaingText: '消息设置',
              onPressed: () {},
            ),
            SettingLine.defaultLine(
              leaingText: '隐私设置',
              onPressed: () {},
            ),
            SettingLine.defaultLine(
              leaingText: '清除缓存',
              onPressed: () {},
            ),
            SettingLine.defaultLine(
              leaingText: '开发者设置',
              onPressed: () {
                GlobalRoute.router.navigateTo(context, Routes.devSetting);
              },
            ),
            SizedBox(height: 10.0),
            SettingLine.defaultLine(
              leaingText: '关于TravelApp',
              onPressed: () {},
            ),
            SizedBox(height: 10.0),
            BlocConsumer<AuthorizationBloc, AuthorizationState>(
              listener: (context, state) {
                if (state is UnAuthorized) {
                  showToast("已退出登录");
                }
              },
              builder: (context, state) {
                if (state is UnAuthorized) {
                  return Container();
                } else {
                  return GestureDetector(
                    onTap: () {
                      _authorizationBloc.add(RevokeAuthorized());
                      _currentUserBloc.add(RemoveCurrentUser());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                        bottom: 15.0,
                        top: 15.0,
                      ),
                      color: Colors.white,
                      child: Text(
                        '退出当前账号',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
