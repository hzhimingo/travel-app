part of 'spot_filter_bloc.dart';

class SpotFilterState extends Equatable {
  final bool isFilterOpen;
  final int currentFilter;
  final List<FilterItemData> filterData;

  SpotFilterState({
    this.isFilterOpen,
    this.currentFilter,
    this.filterData,
  });

  factory SpotFilterState.defaultClose() {
    return SpotFilterState(
      isFilterOpen: false,
      currentFilter: 0,
      filterData: [
        FilterItemData(
          currentTag: 0,
          tags: {
            0: "综合排序",
            1: "点评最多",
          },
          paramName: "sortType",
        ),
        FilterItemData(
          currentTag: 0,
          tags: {
            0: "全部商圈",
            1: "火车站商圈",
            2: "滕王阁商圈",
            3: "八一广场商圈",
            4: "红谷滩新区",
            5: "艾溪湖高新开发区",
            6: "青山湖商圈",
          },
          paramName: "area",
        ),
        FilterItemData(
          currentTag: 0,
          tags: {
            0: "类型",
            1: "公园/国家公园",
            2: "江河湖海",
            3: "瀑布",
            4: "山",
            5: "综合景区",
            6: "树木/森林",
          },
          paramName: "spotType",
        ),
      ],
    );
  }

  SpotFilterState update({
    bool isFilterOpen,
    int currentFilter,
    int newTag,
  }) {
    if (newTag != null) {
      var currntFilterData = this.filterData;
      currntFilterData[currentFilter].currentTag = newTag;
      return copyWith(
        isFilterOpen: isFilterOpen,
        currentFilter: currentFilter,
        filterData: currntFilterData,
      );
    } else {
      return copyWith(
        isFilterOpen: isFilterOpen,
        currentFilter: currentFilter,
      );
    }
  }

  SpotFilterState copyWith({
    bool isFilterOpen,
    int currentFilter,
    List<FilterItemData> filterData,
  }) {
    return SpotFilterState(
      isFilterOpen: isFilterOpen ?? this.isFilterOpen,
      currentFilter: currentFilter ?? this.currentFilter,
      filterData: filterData ?? this.filterData,
    );
  }

  @override
  List<Object> get props => [isFilterOpen, currentFilter, filterData];
}

//ignore: must_be_immutable
class FilterItemData extends Equatable {
  int currentTag;
  Map<int, String> tags;
  String paramName;

  FilterItemData({
    @required this.currentTag,
    @required this.tags,
    @required this.paramName,
  });

  @override
  List<Object> get props => [currentTag, tags, paramName];
}
