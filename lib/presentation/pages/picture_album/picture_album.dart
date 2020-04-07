import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class PictureAlbum extends StatefulWidget {
  PictureAlbum({Key key}) : super(key: key);

  @override
  _PictureAlbumState createState() => _PictureAlbumState();
}

class _PictureAlbumState extends State<PictureAlbum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        centerTitle: true,
        title: Text(
          '相册集',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
