import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/spot_filter/spot_filter_bloc.dart';

class FilterDropList extends StatefulWidget {
  final List<FilterDropData> filterData;

  FilterDropList({
    Key key,
    this.filterData,
  }) : super(key: key);

  @override
  _FilterDropListState createState() => _FilterDropListState();
}

class _FilterDropListState extends State<FilterDropList> {
  int selectIndex = 0;
  SpotFilterBloc _spotFilterBloc;

  @override
  void initState() {
    super.initState();
    _spotFilterBloc = BlocProvider.of<SpotFilterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.filterData.length,
        itemBuilder: _buildFilterDropItem,
      ),
    );
  }

  Widget _buildFilterDropItem(context, index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
        _spotFilterBloc.add(
          CloseAndUpdateSpotFilter(
            updateFilterIndex: _spotFilterBloc.state.currentFilter,
            newTag: widget.filterData[index].data,
          ),
        );
      },
      child: FilterDropItem(
        isSelected: _spotFilterBloc.state
                .filterData[_spotFilterBloc.state.currentFilter].currentTag ==
            widget.filterData[index].data,
        text: widget.filterData[index].text,
        data: widget.filterData[index].data,
      ),
    );
  }
}

class FilterDropData {
  final String text;
  final int data;

  FilterDropData({this.text, this.data});
}

class FilterDropItem extends StatelessWidget {
  final bool isSelected;
  final String text;
  final int data;

  const FilterDropItem({
    Key key,
    this.isSelected,
    this.text,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15.0,
        bottom: 15.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200],
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Offstage(
            offstage: !isSelected,
            child: Icon(
              Icons.check_circle,
              color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}
