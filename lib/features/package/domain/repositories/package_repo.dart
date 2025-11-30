import 'package:electrum/core/types/repo_result.dart';
import 'package:electrum/features/package/domain/entities/package.dart';

abstract class PackageRepo {
  Future<RepoResult<List<Package>>> getPackages();
}
