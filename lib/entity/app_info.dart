class AppInfo {
  String appVersion;
  List<Api> api;

  AppInfo({this.appVersion, this.api});

  AppInfo.fromJson(Map<String, dynamic> json) {
    appVersion = json['appVersion'];
    if (json['api'] != null) {
      api = new List<Api>();
      json['api'].forEach((v) {
        api.add(new Api.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appVersion'] = this.appVersion;
    if (this.api != null) {
      data['api'] = this.api.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Api {
  String apiVersion;
  String type;
  String host;
  String prefix;

  Api({this.apiVersion, this.type, this.host, this.prefix});

  Api.fromJson(Map<String, dynamic> json) {
    apiVersion = json['apiVersion'];
    type = json['type'];
    host = json['host'];
    prefix = json['prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiVersion'] = this.apiVersion;
    data['type'] = this.type;
    data['host'] = this.host;
    data['prefix'] = this.prefix;
    return data;
  }
}