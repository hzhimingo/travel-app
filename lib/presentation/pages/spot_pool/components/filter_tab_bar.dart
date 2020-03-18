import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/spot_filter/spot_filter_bloc.dart';

class FilterTabBar extends StatefulWidget {
  FilterTabBar({
    Key key,
  }) : super(key: key);

  @override
  _FilterTabBarState createState() => _FilterTabBarState();
}

class _FilterTabBarState extends State<FilterTabBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotFilterBloc, SpotFilterState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          height: 45.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildFilterItems(context, state),
          ),
        );
      },
    );
  }

  _buildFilterItems(BuildContext context, SpotFilterState state) {
    List<Widget> _filterItem = [];
    for (int i = 0; i < state.filterData.length; i++) {
      _filterItem.add(
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              if (state.isFilterOpen && state.currentFilter == i) {
                context.bloc<SpotFilterBloc>().add(CloseSpotFilterNoParams());
              } else {
                context.bloc<SpotFilterBloc>().add(OpenSpotFilter(index: i));
              }
            },
            child: FilterItem(
              text: state.filterData[i].tags[state.filterData[i].currentTag],
            ),
          ),
        ),
      );
    }
    return _filterItem;
  }
}

class FilterItem extends StatelessWidget {
  final String text;
  const FilterItem({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width / 4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              size: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}
