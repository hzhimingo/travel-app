import 'package:extended_image/extended_image.dart';
import 'package:fluro/fluro.dart';
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
      body: ListView.builder(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        itemCount: 6,
        itemBuilder: (context, index) => _PictureAlbumItem(),
      ),
    );
  }
}

class _PictureAlbumItem extends StatelessWidget {
  const _PictureAlbumItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GlobalRoute.router.navigateTo(
          context,
          '/pictureAlbumDetail',
          transition: TransitionType.cupertino,
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: Offset.zero,
              spreadRadius: 5.0,
              blurRadius: 4.0,
              color: Color.fromRGBO(246, 247, 249, 1.0),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExtendedNetworkImageProvider(
                    'https://n1-q.mafengwo.net/s15/M00/90/0C/CoUBGV5LrpOAWQc1AA1VUnodFdI327.jpg',
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '默认',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
