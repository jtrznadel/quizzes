import 'package:quiz_app/core/utils/typedefs.dart';
import 'package:quiz_app/core/utils/usecases.dart';
import 'package:quiz_app/features/auth/domain/repositories/auth_repo.dart';

class SignOut extends FutureUsecaseWitoutParams<void> {
  const SignOut(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call() => _repo.signOut();
}
