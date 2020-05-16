import 'package:dio/dio.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class PostMomentForm {
  int userId;
  String title;
  String content;
  List<MultipartFile> pictures;
  int spot;
  List<int> topics;

  PostMomentForm({
    this.userId,
    this.content,
    this.title,
    this.pictures,
    this.spot,
    this.topics,
  });
}