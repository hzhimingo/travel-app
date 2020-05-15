import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:travel/route/routes.dart';

class CommentInputLine extends StatefulWidget {
  final String commentTo;
  final Widget child;
  final ValueChanged onSubmit;
  CommentInputLine({
    Key key,
    this.child,
    this.onSubmit,
    this.commentTo,
  }) : super(key: key);

  @override
  _CommentInputLineState createState() => _CommentInputLineState();
}

class _CommentInputLineState extends State<CommentInputLine> {
  AuthorizationBloc _authorizationBloc;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _authorizationBloc = BlocProvider.of<AuthorizationBloc>(context);
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_authorizationBloc.state is UnAuthorized) {
          GlobalRoute.router.navigateTo(context, '/login');
        } else {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            isScrollControlled: true,
            builder: (context) {
              return SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 15.0,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '评论',
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      TextField(
                        maxLines: 3,
                        autofocus: true,
                        controller: _controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "回复${widget.commentTo}",
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 45.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.tag_faces),
                            GestureDetector(
                              onTap: () {
                                if (_controller.text != "") {
                                  widget.onSubmit(_controller.text);
                                  _controller.clear();
                                  Navigator.of(context).pop();
                                } else {
                                  showToast("内容不能为空");
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 3.0,
                                  bottom: 3.0,
                                ),
                                child: Text(
                                  '发布',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
      child: widget.child,
    );
  }
}
