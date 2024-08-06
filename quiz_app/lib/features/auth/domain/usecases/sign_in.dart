import 'package:equatable/equatable.dart';
import 'package:quiz_app/core/utils/typedefs.dart';
import 'package:quiz_app/core/utils/usecases.dart';
import 'package:quiz_app/features/auth/domain/entities/auth_response_entity.dart';
import 'package:quiz_app/features/auth/domain/repositories/auth_repo.dart';

class SignIn extends FutureUsecaseWithParams<AuthResponseEntity, SignInParams> {
  const SignIn(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<AuthResponseEntity> call(SignInParams params) => _repo.signIn(email: params.email, password: params.password);
}

class SignInParams extends Equatable {
  const SignInParams({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
