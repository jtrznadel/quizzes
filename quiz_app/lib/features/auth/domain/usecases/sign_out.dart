import '../../../../core/utils/typedefs.dart';
import '../../../../core/utils/usecases.dart';
import '../repositories/auth_repo.dart';

class SignOut extends FutureUsecaseWitoutParams<void> {
  const SignOut(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call() => _repo.signOut();
}
