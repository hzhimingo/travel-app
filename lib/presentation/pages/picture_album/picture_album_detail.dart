import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class PictureAlbumDetail extends StatelessWidget {
  const PictureAlbumDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0.8,
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
          'XXXXX',
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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2.0,
          childAspectRatio: 1.0,
          crossAxisSpacing: 2.0,
        ),
        itemBuilder: (context, index) => Container(
          color: Colors.yellow,
        ),
      ),
    );
  }
}
