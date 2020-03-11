import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/data/datasources/local/authorization_local_datasource.dart';
import 'package:travel/data/datasources/local/user_local_datasource.dart';
import 'package:travel/data/datasources/remote/authorzation_remote_datasource.dart';
import 'package:travel/data/datasources/remote/moment_remote_datasource.dart';
import 'package:travel/data/datasources/remote/topic_remote_datasource.dart';
import 'package:travel/data/datasources/remote/user_remote_datasource.dart';
import 'package:travel/data/repositories/authorzation_repository.dart';
import 'package:travel/data/repositories/moment_repository.dart';
import 'package:travel/data/repositories/topic_repository.dart';
import 'package:travel/data/repositories/user_repository.dart';
import 'package:travel/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:travel/presentation/blocs/current_user/current_user_bloc.dart';
import 'package:travel/presentation/blocs/hot_topic/hot_topic_bloc.dart';
import 'package:travel/presentation/blocs/login/login_bloc.dart';
import 'package:travel/presentation/blocs/moment_detail/moment_detail_bloc.dart';
import 'package:travel/presentation/blocs/moment_pool/moment_pool_bloc.dart';
import 'package:travel/presentation/blocs/topic_pool/topic_pool_bloc.dart';
import 'package:travel/service/authorization_service.dart';
import 'package:travel/service/moment_service.dart';
import 'package:travel/service/topic_service.dart';
import 'package:travel/service/user_service.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  //bloc factory:
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
  
   //http local
  getIt.registerSingleton<Dio>(Http.initHttpConfig());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  //特殊情况
  getIt.registerSingleton<UserLocalDataSource>(UserLocalDataSource(sharedPreferences: getIt()));
  getIt.registerSingleton<UserRepository>(UserRepository(userLocal: getIt()));
  getIt.registerSingleton<UserService>(UserService(userRepository: getIt()));

  //local datasource
  getIt.registerLazySingleton(
    () => AuthorizationLocalDataSource(sharedPreferences: getIt()),
  );

  //remote datasource
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

  //repository
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

  //service
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
}


