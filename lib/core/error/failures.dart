import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final DioException? error;

  const Failure({this.error});

  @override
  List<Object?> get props => [error];
}

class ServerFailure extends Failure {
  final String message;

  const ServerFailure({required this.message}) : super();

  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
  final String message;

  const NetworkFailure({required this.message}) : super();

  @override
  List<Object?> get props => [message];
}

class DataSuccess<T> extends Failure {
  const DataSuccess() : super(error: null);
}

class DataFailed<T> extends Failure {
  const DataFailed(DioException error) : super(error: error);
}

class NotFoundFailure extends Failure {}
