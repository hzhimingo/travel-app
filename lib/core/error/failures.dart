import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure { 
  @override
  List<Object> get props => [];
}

class ApiFailure extends Failure {
  final String msg;

  ApiFailure(this.msg);
  @override
  List<Object> get props => [msg];
}

class CacheNotExistFailure extends Failure {
  @override
  List<Object> get props => [];
}
