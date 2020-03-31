import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/entity/spot_filter.dart';
import 'package:travel/presentation/blocs/spot_pool/spot_pool_bloc.dart';

class SpotFilterTabBar extends StatelessWidget {
  final List<SpotFilter> spotFilters;
  final int currentFilter;
  final bool isFilterOpen;

  const SpotFilterTabBar({
    Key key,
    @required this.isFilterOpen,
    @required this.spotFilters,
    @required this.currentFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.5,
            offset: Offset.zero,
          ),
        ]
      ),
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildFilterItems(context),
      ),
    );
  }

  _buildFilterItems(BuildContext context) {
    //ignore: close_sinks
    final SpotPoolBloc _spotPoolBloc = BlocProvider.of<SpotPoolBloc>(context);
    List<Widget> _filterItem = [];
    for (int i = 0; i < spotFilters.length; i++) {
      _filterItem.add(
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              if (currentFilter == i && isFilterOpen) {
                //关闭当前
                _spotPoolBloc.add(CloseCurrentFilter());
              } else {
                //打开当前
                _spotPoolBloc.add(OpenFilter(index: i));
              }
            },
            child: _SpotFilterCurrentTag(
              text: _resolveTextFromFilter(spotFilters[i]),
            ),
          ),
        ),
      );
    }
    return _filterItem;
  }

  _resolveTextFromFilter(SpotFilter filter) {
    for (int i = 0; i < filter.filterItems.length; i++) {
      if (filter.currentNo == filter.filterItems[i].no) {
        return filter.filterItems[i].name;
      }
    }
  }
}

class _SpotFilterCurrentTag extends StatelessWidget {
  final String text;
  const _SpotFilterCurrentTag({Key key, this.text}) : super(key: key);

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
