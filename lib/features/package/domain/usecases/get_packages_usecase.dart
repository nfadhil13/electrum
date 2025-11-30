import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/package/domain/entities/package.dart';
import 'package:electrum/features/package/domain/repositories/package_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPackagesUsecase extends UsecaseNoParams<List<Package>> {
  final PackageRepo _repo;
  GetPackagesUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<List<Package>>> execute() => _repo.getPackages().asResource;
}
