import 'package:electrum/core/types/nothing.dart';
import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUsecase extends UsecaseNoParams<Nothing> {
  final AuthRepo _repo;
  LogoutUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<Nothing>> execute() => _repo.logout().asResource;
}

