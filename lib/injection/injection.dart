import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/data/datasources/local/authorization_local_datasource.dart';
import 'package:travel/data/datasources/remote/authorzation_remote_datasource.dart';
import 'package:travel/data/repositories/authorzation_repository.dart';
import 'package:travel/service/authorization_service.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerSingleton<Dio>(Http.initHttpConfig());
  getIt.registerSingleton<AuthorizationLocalDataSource>(AuthorizationLocalDataSource(sharedPreferences: getIt()));
  getIt.registerSingleton<AuthorizationRemoteDataSource>(AuthorizationRemoteDataSource(http: getIt()));
  getIt.registerSingleton<AuthorizationRepository>(AuthorizationRepository(remote: getIt(), local: getIt()));
  getIt.registerSingleton<AuthorizationService>(AuthorizationService(repository: getIt()));

}