import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/presentation/blocs/spot_filter/spot_filter_bloc.dart';
import 'package:travel/presentation/pages/spot_pool/components/components.dart';

class FilterContent extends StatefulWidget {
  final Widget body;

  FilterContent({
    Key key,
    this.body,
  }) : super(key: key);

  @override
  _FilterContentState createState() => _FilterContentState();
}

class _FilterContentState extends State<FilterContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.body,
        BlocBuilder<SpotFilterBloc, SpotFilterState>(
          builder: (context, state) {
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
                            .bloc<SpotFilterBloc>()
                            .add(CloseSpotFilterNoParams());
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
                      child: _buildFilterDropList(state),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  _buildFilterDropList(SpotFilterState state) {
    List<FilterDropData> filterData = [];
    state.filterData[state.currentFilter].tags.forEach((id, tag) {
      FilterDropData filterDropData = FilterDropData(
        text: tag,
        data: id,
      );
      filterData.add(filterDropData);
    });
    return FilterDropList(
      filterData: filterData,
    );
  }
}
