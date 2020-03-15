import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:extended_image/extended_image.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';

class CommentInputLine extends StatelessWidget {
  const CommentInputLine({Key key}) : super(key: key);

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
                child: GestureDetector(
                  onTap: () {
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
                                  maxLines: 4,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "回复小小D小蘑菇"
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 45.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(Icons.tag_faces),
                                      Icon(Icons.crop_original),
                                      Icon(Icons.crop_original),
                                      Icon(Icons.crop_original),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
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
