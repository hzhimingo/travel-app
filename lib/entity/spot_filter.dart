class SpotFilter {
  String paramsName;
  int currentNo;
  List<SpotFilterItem> filterItems;

  SpotFilter({this.paramsName, this.filterItems});

  SpotFilter.fromJson(Map<String, dynamic> json) {
    paramsName = json['paramsName'];
    currentNo = json['currentNo'];
    if (json['filterItems'] != null) {
      filterItems = new List<SpotFilterItem>();
      json['filterItems'].forEach((v) {
        filterItems.add(new SpotFilterItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paramsName'] = this.paramsName;
    data['currentNo'] = this.currentNo;
    if (this.filterItems != null) {
      data['filterItems'] = this.filterItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SpotFilterItem {
  int no;
  String name;

  SpotFilterItem({this.no, this.name});

  SpotFilterItem.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['name'] = this.name;
    return data;
  }
}