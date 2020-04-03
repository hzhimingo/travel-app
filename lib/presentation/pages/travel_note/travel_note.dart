import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class TravelNote extends StatelessWidget {
  const TravelNote({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            GlobalRoute.router.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 40.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(246, 247, 249, 1.0),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.black26,
                size: 20.0,
              ),
              SizedBox(width: 5.0),
              Text(
                '搜索游记',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TravelNoteSwiperPool(),
            TravelNotePool(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}
