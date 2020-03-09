class Picture {
  int pictureId;
  String url;
  int width;
  int height;

  Picture({this.pictureId, this.url, this.width, this.height});

  Picture.fromJson(Map<String, dynamic> json) {
    pictureId = json['pictureId'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pictureId'] = this.pictureId;
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}