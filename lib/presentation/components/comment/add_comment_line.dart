import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/presentation/components/comment/comment_input_line.dart';

class AddCommentLine extends StatelessWidget{
  final String commentTo;
  final ValueChanged onSend;

  AddCommentLine({this.commentTo, this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      margin: EdgeInsets.only(
        top: 15.0,
        bottom: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 15.0,
            ),
            child: Text(
              '评论',
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              BlocBuilder<CurrentUserBloc, CurrentUserState>(
                builder: (context, state) {
                  if (state is CurrentUserLoaded) {
                    return CircleAvatar(
                      radius: 20.0,
                      backgroundImage: ExtendedNetworkImageProvider(
                        state.currentUser.avatar,
                      ),
                    );
                  } else {
                    return CircleAvatar(
                      radius: 20.0,
                      backgroundImage: ExtendedNetworkImageProvider(
                        'https://assets.leetcode-cn.com/aliyun-lc-upload/default_avatar.png',
                      ),
                    );
                  }
                },
              ),
              Expanded(
                child: CommentInputLine(
                  commentTo: commentTo,
                  onSubmit: (value) {
                    onSend(value);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10.0),
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(246, 247, 249, 1.0),
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    child: Text('快来评论吧~'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
