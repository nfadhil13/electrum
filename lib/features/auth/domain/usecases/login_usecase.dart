import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/auth/domain/entities/login_form.dart';
import 'package:electrum/features/auth/domain/entities/user.dart';
import 'package:electrum/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase extends Usecase<LoginFormEntity, UserEntity> {
  final AuthRepo _repo;
  LoginUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<UserEntity>> execute(LoginFormEntity params) =>
      _repo.login(params).asResource;
}
