import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final AuthorizationBloc _authorizationBloc = BlocProvider.of<AuthorizationBloc>(context);
    //ignore: close_sinks
    final CurrentUserBloc _currentUserBloc = BlocProvider.of<CurrentUserBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('退出登录'),
            onPressed: () {
              _authorizationBloc.add(RevokeAuthorized());
              _currentUserBloc.add(RemoveCurrentUser());
            },
          ),
        ],
      ),
    );
  }
}
