import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel/entity/comment_cover.dart';
import 'package:travel/presentation/blocs/comment_cover_pool/comment_cover_pool_bloc.dart';

class CommentCoverLine extends StatefulWidget {
  final CommentCover commentCover;
  CommentCoverLine({Key key, this.commentCover}) : super(key: key);

  @override
  _CommentCoverLineState createState() => _CommentCoverLineState();
}

class _CommentCoverLineState extends State<CommentCoverLine> {

  CommentCoverPoolBloc _commentCoverPoolBloc;
  TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _commentCoverPoolBloc = BlocProvider.of<CommentCoverPoolBloc>(context);
    _editingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 18.0,
            backgroundImage: ExtendedNetworkImageProvider(
              widget.commentCover.authorAvatar,
            ),
          ),
          SizedBox(width: 15.0),
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
                              maxLines: 3,
                              autofocus: true,
                              controller: _editingController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "回复${widget.commentCover.authorNickname}",
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
                                  GestureDetector(
                                    onTap: () {
                                      if (_editingController.text != "") {
                                         _commentCoverPoolBloc.add(AddComment(content: _editingController.text));
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        widget.commentCover.authorNickname,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        widget.commentCover.time,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.commentCover.content,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
