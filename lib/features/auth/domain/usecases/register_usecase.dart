import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/auth/domain/entities/register_form.dart';
import 'package:electrum/features/auth/domain/entities/user.dart';
import 'package:electrum/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUsecase extends Usecase<RegisterFormEntity, UserEntity> {
  final AuthRepo _repo;
  RegisterUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<UserEntity>> execute(RegisterFormEntity params) =>
      _repo.register(params).asResource;
}
