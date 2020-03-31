class ApiException implements Exception {
  final String msg;
  ApiException({this.msg});
}

class ServerException implements Exception {}

class CacheNotExistException implements Exception {}

class CacheSaveException implements Exception {}