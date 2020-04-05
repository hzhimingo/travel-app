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
  static String comment = '/comment';
  static String reply = '/reply';

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
  }
}