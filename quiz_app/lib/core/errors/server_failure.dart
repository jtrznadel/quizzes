import 'package:quiz_app/core/errors/failure.dart';
import 'package:quiz_app/core/errors/server_exception.dart';

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode});

  ServerFailure.fromException(ServerException e) : this(message: e.message, statusCode: e.statusCode);
}
