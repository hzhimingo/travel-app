import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/search_history/search_history_bloc.dart';

class SearchHistoryPanel extends StatelessWidget {
  const SearchHistoryPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchHistoryBloc, SearchHistoryState>(
      builder: (context, state) {
        return Offstage(
          offstage: state.searchHistories.length == 0,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              top: 5.0,
              bottom: 30.0,
              left: 15.0,
              right: 15.0,
            ),
            margin: EdgeInsets.only(bottom: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '历史记录',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        size: 18.0,
                      ),
                      onPressed: () {
                        context.bloc<SearchHistoryBloc>().add(ClearAllSearchHistory());
                      },
                    ),
                  ],
                ),
                Wrap(
                  spacing: 5.0,
                  runSpacing: 8.0,
                  children: _buildHistories(state.searchHistories),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildHistories(List<String> histories) {
    List<Widget> children = [];
    for (int i = 0; i < histories.length; i++) {
      children.add(
        _SearchHistoryItem(text: histories[i])
      );
    }
    return children;
  }
}

class _SearchHistoryItem extends StatelessWidget {
  final String text;
  const _SearchHistoryItem({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 2,
      ),
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 4.0,
        bottom: 4.0,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 247, 249, 1.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }
}
