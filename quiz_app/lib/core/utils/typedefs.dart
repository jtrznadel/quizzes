import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/server_exception.dart';

typedef ResultFuture<T> = Future<Either<ServerException, T>>;
