import 'package:travel/entity/picture.dart';

class MomentCover {
  int isFavorite;
  int favoriteNum;
  int momentId;
  String coverText;
  String authorName;
  String authorAvatar;
  Picture coverImage;
  String location;

  MomentCover(
      {this.isFavorite,
      this.favoriteNum,
      this.momentId,
      this.coverText,
      this.authorName,
      this.authorAvatar,
      this.coverImage,
      this.location});

  MomentCover.fromJson(Map<String, dynamic> json) {
    isFavorite = json['isFavorite'];
    favoriteNum = json['favoriteNum'];
    momentId = json['momentId'];
    coverText = json['coverText'];
    authorName = json['authorName'];
    authorAvatar = json['authorAvatar'];
    coverImage = json['coverImage'] != null
        ? new Picture.fromJson(json['coverImage'])
        : null;
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFavorite'] = this.isFavorite;
    data['favoriteNum'] = this.favoriteNum;
    data['momentId'] = this.momentId;
    data['coverText'] = this.coverText;
    data['authorName'] = this.authorName;
    data['authorAvatar'] = this.authorAvatar;
    if (this.coverImage != null) {
      data['coverImage'] = this.coverImage.toJson();
    }
    data['location'] = this.location;
    return data;
  }
}