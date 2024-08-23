import 'package:equatable/equatable.dart';
import '../../../../core/utils/typedefs.dart';
import '../../../../core/utils/usecases.dart';
import '../entities/auth_response_entity.dart';
import '../repositories/auth_repo.dart';

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
