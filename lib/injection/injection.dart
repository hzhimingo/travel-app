import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/data/datasources/local/authorization_local_datasource.dart';
import 'package:travel/data/datasources/local/user_local_datasource.dart';
import 'package:travel/data/datasources/remote/answer_remote_datasource.dart';
import 'package:travel/data/datasources/remote/authorzation_remote_datasource.dart';
import 'package:travel/data/datasources/remote/moment_remote_datasource.dart';
import 'package:travel/data/datasources/remote/question_remote_datasource.dart';
import 'package:travel/data/datasources/remote/topic_remote_datasource.dart';
import 'package:travel/data/datasources/remote/user_remote_datasource.dart';
import 'package:travel/data/repositories/answer_repository.dart';
import 'package:travel/data/repositories/authorzation_repository.dart';
import 'package:travel/data/repositories/moment_repository.dart';
import 'package:travel/data/repositories/question_respository.dart';
import 'package:travel/data/repositories/topic_repository.dart';
import 'package:travel/data/repositories/user_repository.dart';
import 'package:travel/entity/app_info.dart';
import 'package:travel/presentation/blocs/answer_pool/answer_pool_bloc.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/presentation/blocs/hot_topic/hot_topic_bloc.dart';
import 'package:travel/presentation/blocs/login/login_bloc.dart';
import 'package:travel/presentation/blocs/moment_detail/moment_detail_bloc.dart';
import 'package:travel/presentation/blocs/moment_pool/moment_pool_bloc.dart';
import 'package:travel/presentation/blocs/question_detail/question_detail_bloc.dart';
import 'package:travel/presentation/blocs/question_pool/question_pool_bloc.dart';
import 'package:travel/presentation/blocs/topic_pool/topic_pool_bloc.dart';
import 'package:travel/service/answer_service.dart';
import 'package:travel/service/authorization_service.dart';
import 'package:travel/service/moment_service.dart';
import 'package:travel/service/question_service.dart';
import 'package:travel/service/topic_service.dart';
import 'package:travel/service/user_service.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  //bloc factory:
  registerBloc();
  //http local
  await registerSharedPreferences();
  bool isOK = await initApiUrl();
  if (isOK) {
    registerHttp();
  }
  //特殊情况
  registerCurrentUser();
  //local datasource
  registerLocalDataSource();
  //remote datasource
  registerRemoteDataSource();
  //repository
  registerRepository();
  //service
  registerService();
}

Future<void> registerSharedPreferences() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
}

Future<bool> initApiUrl() async {
  SharedPreferences store = getIt.get<SharedPreferences>();
  AppInfo appInfo = AppInfo(
    appVersion: "1.0",
    api: [
      Api(
        apiVersion: "1.0",
        type: "mock",
        host: "http://rap2api.taobao.org",
        prefix: "/app/mock/236828/travel/api/v1",
      ),
    ],
  );
  if (!store.containsKey("AppInfo")) {
    return await store.setString("AppInfo", json.encode(appInfo.toJson()));
  } else {
    return true;
  }
}

registerHttp() {
  getIt.registerSingleton<Dio>(Http.initHttpConfig());
}

void registerBloc() {
  getIt.registerFactory(
    () => LoginBloc(
      authorizationService: getIt(),
    ),
  );
  getIt.registerFactory(
    () => AuthorizationBloc(
      authorizationService: getIt(),
    ),
  );
  getIt.registerFactory(
    () => CurrentUserBloc(
      userService: getIt(),
    ),
  );
  getIt.registerFactory(
    () => MomentPoolBloc(
      momentService: getIt(),
    ),
  );
  getIt.registerFactory(
    () => HotTopicBloc(
      topicService: getIt(),
    ),
  );
  getIt.registerFactory(
    () => TopicPoolBloc(
      topicService: getIt(),
    ),
  );
  getIt.registerFactory(
    () => MomentDetailBloc(
      momentService: getIt(),
    ),
  );
  getIt.registerFactory(
    () => QuestionPoolBloc(
      questionService: getIt(),
    ),
  );
  getIt.registerFactory(
    () => AnswerPoolBloc(
      answerService: getIt(),
    ),
  );
  getIt.registerFactory(
    () => QuestionDetailBloc(
      questionService: getIt(),
    ),
  );
}

registerRepository() {
  getIt.registerLazySingleton(
    () => AuthorizationRepository(
      authorizationLocal: getIt(),
      authorizationRemote: getIt(),
      userLocal: getIt(),
      userRemote: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => MomentRepository(
      remote: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => TopicRepository(
      remote: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => QuestionRepository(
      remote: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => AnswerRepository(
      remote: getIt(),
    ),
  );
}

registerService() {
  getIt.registerLazySingleton(
    () => AuthorizationService(
      repository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => MomentService(
      repository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => TopicService(
      repository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => QuestionService(
      repository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => AnswerService(
      repository: getIt(),
    ),
  );
}

registerRemoteDataSource() {
  getIt.registerLazySingleton(
    () => AuthorizationRemoteDataSource(http: getIt()),
  );
  getIt.registerLazySingleton(
    () => UserRemoteDataSource(http: getIt()),
  );
  getIt.registerLazySingleton(
    () => MomentRemoteDataSource(http: getIt()),
  );
  getIt.registerLazySingleton(
    () => TopicRemoteDataSource(http: getIt()),
  );
  getIt.registerLazySingleton(
    () => QuestionRemoteDataSource(http: getIt()), 
  );
  getIt.registerLazySingleton(
    () => AnswerRemoteDataSource(http: getIt()), 
  );
}

registerLocalDataSource() {
  getIt.registerLazySingleton(
    () => AuthorizationLocalDataSource(sharedPreferences: getIt()),
  );
}

registerCurrentUser() {
  getIt.registerSingleton<UserLocalDataSource>(
      UserLocalDataSource(sharedPreferences: getIt()));
  getIt.registerSingleton<UserRepository>(UserRepository(userLocal: getIt()));
  getIt.registerSingleton<UserService>(UserService(userRepository: getIt()));
}
