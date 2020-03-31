import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/search_history/search_history_bloc.dart';
import 'package:travel/route/routes.dart';

import './components/components.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  SearchHistoryBloc _searchHistoryBloc;
  TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchHistoryBloc = BlocProvider.of<SearchHistoryBloc>(context);
  }

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
                  controller: _editingController,
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
              child: GestureDetector(
                onTap: () {
                  if (_editingController.text != null && _editingController.text != "") {
                    print(_editingController.text);
                    _searchHistoryBloc.add(AddSearchHistory(searchWords: _editingController.text));
                  }
                },
                child: Text(
                  '搜索',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SearchHistoryPanel(),
          Expanded(
            child: HotSearchPanel(),
          ),
        ],
      ),
    );
  }
}
