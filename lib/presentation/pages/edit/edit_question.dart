import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/presentation/blocs/edit_question/edit_question_bloc.dart';
import 'package:travel/route/routes.dart';

class EditQuestion extends StatefulWidget {
  EditQuestion({Key key}) : super(key: key);

  @override
  _EditQuestionState createState() => _EditQuestionState();
}

class _EditQuestionState extends State<EditQuestion> {
  TextEditingController _titleController;
  TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditQuestionBloc, EditQuestionState>(
      listener: (context, state) {
        if (state is SubmitQuestionIng) {
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
            }
          );
        }
        if (state is SubmitQuestionFailed) {
          GlobalRoute.router.pop(context);
          showToast("发布问题失败，请稍后再试");
        }
        if (state is SubmitQuestionSuccess) {
          GlobalRoute.router.pop(context);
          showToast("发布成功");
          Future.delayed(Duration(seconds: 2));
          GlobalRoute.router.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.8,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
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
              onTap: () {
                if (_titleController.text == "") {
                  showToast("问题标题必填");
                } else {
                  final currentState = context.bloc<CurrentUserBloc>().state;
                  if (currentState is CurrentUserLoaded) {
                    context.bloc<EditQuestionBloc>()
                      ..add(
                        SubmitQuestion(
                          userId: currentState.currentUser.userId,
                          title: _titleController.text,
                          content: _contentController.text,
                        ),
                      );
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
                    borderRadius: BorderRadius.circular(8.0),
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
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  controller: _titleController,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    hintText: '清晰描述你的问题',
                    hintStyle: TextStyle(
                      fontSize: 19.0,
                      color: Colors.grey[400],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[300],
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextField(
                  maxLines: 6,
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                  controller: _contentController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '在此详细描述你的问题',
                    hintStyle: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
