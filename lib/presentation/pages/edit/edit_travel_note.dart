import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class EditTravelNote extends StatefulWidget {
  EditTravelNote({Key key}) : super(key: key);

  @override
  _EditTravelNoteState createState() => _EditTravelNoteState();
}

class _EditTravelNoteState extends State<EditTravelNote> {

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            GlobalRoute.router.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 12.0,
              bottom: 12.0,
            ),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 15.0),
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 5.0,
                bottom: 5.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.grey[300],
                ),
              ),
              child: Text(
                '存草稿',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Padding(
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
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: 60.0,
        ),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Text(
                  '添加封面',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[500]),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15.0),
              child: ExtendedTextField(
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: '请输入游记标题',
                  hintStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[200],
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[200],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: '请输入正文',
                  hintStyle: TextStyle(fontSize: 19.0, color: Colors.grey[400]),
                ),
                maxLines: null,
                minLines: 1,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset.zero,
              blurRadius: 3.0,
              spreadRadius: 3.0,
              color: Color.fromRGBO(246, 247, 249, 1.0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.title),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
