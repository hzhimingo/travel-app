import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/entity/spot_filter.dart';
import 'package:travel/presentation/blocs/spot_pool/spot_pool_bloc.dart';

class SpotFilterContent extends StatelessWidget {
  final Widget body;
  const SpotFilterContent({Key key, @required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        body,
        BlocConsumer<SpotPoolBloc, SpotPoolState>(
          listener: (context, state) {},
          buildWhen: (previous, current) {
            return current is SpotPoolLoaded;
          },
          //ignore: missing_return
          builder: (context, state) {
            if (state is SpotPoolLoaded) {
              return Offstage(
                offstage: !state.isFilterOpen,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          context
                              .bloc<SpotPoolBloc>()
                              .add(CloseCurrentFilter());
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          constraints: BoxConstraints(
                            maxHeight: 250.0,
                          ),
                          child: SpotFilterDropList(
                            filterIndex: state.currentFilter,
                            spotFilter: state.filters[state.currentFilter],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

class SpotFilterDropList extends StatefulWidget {
  final int filterIndex;
  final SpotFilter spotFilter;
  SpotFilterDropList({
    Key key,
    @required this.spotFilter,
    @required this.filterIndex,
  }) : super(key: key);

  @override
  _SpotFilterDropListState createState() => _SpotFilterDropListState();
}

class _SpotFilterDropListState extends State<SpotFilterDropList> {
  int selectNo;
  SpotPoolBloc _spotPoolBloc;

  @override
  void initState() {
    super.initState();
    _spotPoolBloc = BlocProvider.of<SpotPoolBloc>(context);
    selectNo = widget.spotFilter.currentNo;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.spotFilter.filterItems.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectNo = widget.spotFilter.filterItems[index].no;
            });
            _spotPoolBloc.add(
              CloseAndUpdateFilter(
                filterIndex: widget.filterIndex,
                no: widget.spotFilter.filterItems[index].no,
              ),
            );
          },
          child: _SpotFilterDropListItem(
            isSelected: widget.spotFilter.filterItems[index].no == selectNo,
            text: widget.spotFilter.filterItems[index].name,
            data: widget.spotFilter.filterItems[index].no,
          ),
        ),
      ),
    );
  }
}

class _SpotFilterDropListItem extends StatelessWidget {
  final bool isSelected;
  final String text;
  final int data;

  const _SpotFilterDropListItem({
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
