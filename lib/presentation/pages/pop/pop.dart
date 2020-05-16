import 'dart:ui';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:travel/route/routes.dart';

class Pop extends StatelessWidget {
  const Pop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthorizationBloc _authorizationBloc =
        BlocProvider.of<AuthorizationBloc>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: MediaQueryData.fromWindow(window).padding.top,
          bottom: 12.0,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 9.0,
            sigmaY: 9.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          GlobalRoute.router.pop(context);
                          if (_authorizationBloc.state is UnAuthorized) {
                            GlobalRoute.router.navigateTo(context, '/login');
                          } else {
                            GlobalRoute.router
                                .navigateTo(context, '/editMoment');
                          }
                        },
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '发布瞬间',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          GlobalRoute.router.pop(context);
                          if (_authorizationBloc.state is UnAuthorized) {
                            GlobalRoute.router.navigateTo(
                              context,
                              '/login',
                              transition: TransitionType.cupertino,
                            );
                          } else {
                            GlobalRoute.router.navigateTo(
                              context,
                              '/editQuestion',
                              transition: TransitionType.cupertino,
                            );
                          }
                        },
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.question_answer,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '提问',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 28.0,
                ),
                onPressed: () {
                  GlobalRoute.router.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
