import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/presentation/blocs/edit_answer/edit_answer_bloc.dart';
import 'package:travel/route/routes.dart';

class EditAnswer extends StatefulWidget {
  final int question;
  EditAnswer({Key key, this.question}) : super(key: key);

  @override
  _EditAnswerState createState() => _EditAnswerState();
}

class _EditAnswerState extends State<EditAnswer> {
  TextEditingController _answerController;
  List<Asset> images = List<Asset>();

  @override
  void initState() {
    super.initState();
    _answerController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditAnswerBloc, EditAnswerState>(
      listener: (context, state) {
        if (state is SubmitAnswerSuccess) {
          showToast("发布成功");
          GlobalRoute.router.pop(context);
          GlobalRoute.router.pop(context);
        }
        if (state is SubmitAnswerFailed) {
          showToast("发布失败，请稍后再试");
        }
        if (state is SubmitAnswerIng) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.white,
                  child: SpinKitRing(color: Colors.blue),
                );
              });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              GlobalRoute.router.pop(context);
            },
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () async {
                if (context.bloc<AuthorizationBloc>().state is UnAuthorized) {
                  GlobalRoute.router.navigateTo(
                    context,
                    '/login',
                    transition: TransitionType.cupertino,
                  );
                } else {
                  if (_answerController.text == "") {
                    showToast("请填写回答内容");
                  } else {
                    List<MultipartFile> pictures = new List<MultipartFile>();
                    for (Asset asset in images) {
                      ByteData byteData = await asset.getByteData(quality: 20);
                      List<int> imageData = byteData.buffer.asUint8List();
                      MultipartFile multipartFile = new MultipartFile.fromBytes(
                        imageData,
                        filename: 'picture',
                        contentType: MediaType("image", "jpg"),
                      );
                      pictures.add(multipartFile);
                    }
                    final currentState = context.bloc<CurrentUserBloc>().state;
                    if (currentState is CurrentUserLoaded) {
                      context.bloc<EditAnswerBloc>().add(
                            SubmitAnswer(
                              userId: currentState.currentUser.userId,
                              content: _answerController.text,
                              question: widget.question,
                              pics: pictures,
                            ),
                          );
                    }
                  }
                }
              },
              child: Padding(
                padding: EdgeInsets.only(
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 15.0),
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blueAccent,
                  ),
                  child: Text(
                    '发布',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextField(
                  maxLines: 15,
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                  controller: _answerController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '填写回答内容',
                    hintStyle: TextStyle(
                      fontSize: 17.0,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 10.0,
                  bottom: 20.0,
                ),
                height: (MediaQuery.of(context).size.width / 5) + 30.0,
                child: _buildImageListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadAssets() async {
    setState(() {
      if (images.length == 0) {
        images = List<Asset>();
      }
    });
    List<Asset> resultList;
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        materialOptions: MaterialOptions(
          allViewTitle: '全部照片/视频',
          actionBarTitle: '全部照片/视频',
          startInAllView: true,
        ),
      );
    } on Exception catch (e) {}

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      if (resultList.length != 0) {
        images.addAll(resultList);
      } else {
        images = resultList;
      }
    });
  }

  _buildImageListView() {
    List<Widget> children = List<Widget>();
    children.add(GestureDetector(
      onTap: () {
        loadAssets();
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey[300],
          ),
        ),
        child: Icon(
          Icons.add,
          color: Colors.grey[300],
          size: 40.0,
        ),
      ),
    ));
    images.forEach((item) {
      children.insert(0, _singlePictureItem(item));
    });
    return ListView(
      scrollDirection: Axis.horizontal,
      children: children,
    );
  }

  _singlePictureItem(Asset asset) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: AssetThumb(
        asset: asset,
        width: 500,
        height: 500,
      ),
    );
  }
}
