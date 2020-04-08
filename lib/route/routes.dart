import 'package:fluro/fluro.dart';
import 'handler.dart';

class GlobalRoute {
  static Router router;
}

class Routes {
  static String root = '/';
  static String login = '/login';
  static String pop = '/pop';
  static String settings = '/settings';
  static String momentDetail = '/momentDetail';
  static String topicDetail = '/topicDetail';
  static String questionDetail = '/questionDetail';
  static String devSetting = '/devSetting';
  static String answerDetail = '/answerDetail';
  static String search = '/search';
  static String spotPool = '/spotPool';
  static String spotDetail = '/spotDetail';
  static String travelNote = '/travelNote';
  static String citySelector = '/citySelector';
  static String pictureSelector = '/pictureSelector';
  static String editMoment = '/editMoment';
  static String editTravelNote = '/editTravelNote';
  static String editQuestion = '/editQuestion';
  static String comment = '/comment';
  static String reply = '/reply';
  static String history = '/history';
  static String favorite = '/favorite';
  static String follow = '/follow';
  static String messageCenter = '/messageCenter';
  static String collect = '/collect';
  static String pictureAlbum = '/pictureAlbum';
  static String spotMap = '/spotMap';
  static String pictureAlbumDetail = '/pictureAlbumDetail';

  static void configureRoutes(Router router) {
    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(pop, handler: popHandler);
    router.define(settings, handler: settingsHandler);
    router.define(momentDetail, handler: momentDetailHandler);
    router.define(topicDetail, handler: topicDetailHandler);
    router.define(questionDetail, handler: questionDetailHandler);
    router.define(devSetting, handler: devSettingHandler);
    router.define(answerDetail, handler: answerDetailHandler);
    router.define(search, handler: searchHandler);
    router.define(spotPool, handler: spotPoolHandler);
    router.define(spotDetail, handler: spotDetailHandler);
    router.define(travelNote, handler: travelNoteHanlder);
    router.define(citySelector, handler: citySelectorHandler);
    router.define(pictureSelector, handler: pictureSelectorHandler);
    router.define(editMoment, handler: editMomentHandler);
    router.define(comment, handler: commentPageHandler);
    router.define(reply, handler: replyHandler);
    router.define(editTravelNote, handler: editTravelNoteHandler);
    router.define(editQuestion, handler: editQuestionHandler);
    router.define(history, handler: historyHandler);
    router.define(favorite, handler: favoriteHandler);
    router.define(follow, handler: followHandler);
    router.define(messageCenter, handler: messageCenterHandler);
    router.define(collect, handler: collectHandler);
    router.define(pictureAlbum, handler: pictureAlbumHandler);
    router.define(spotMap, handler: spotMapHandler);
    router.define(pictureAlbumDetail, handler: pictureAlbumDetailHandler);
  }
}