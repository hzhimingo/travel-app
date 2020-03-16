import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => GlobalRoute.router.pop(context),
        ),
        centerTitle: true,
        title: Container(
          width: 260.0,
          height: 40.0,
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(246, 247, 249, 1.0),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.search, color: Colors.black38),
              SizedBox(width: 5.0),
              Expanded(
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "武大樱花",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Center(
              child: Text(
                '搜索',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text('Search'),
      ),
    );
  }
}
