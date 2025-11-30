import 'package:electrum/core/types/repo_result.dart';
import 'package:electrum/features/package/data/datasources/package_network_dts.dart';
import 'package:electrum/features/package/domain/entities/package.dart';
import 'package:electrum/features/package/domain/repositories/package_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PackageRepo)
class PackageRepoImpl implements PackageRepo {
  final PackageNetworkDts _packageNetworkDts;

  PackageRepoImpl(this._packageNetworkDts);

  @override
  Future<RepoResult<List<Package>>> getPackages() async {
    final packages = await _packageNetworkDts.getPackages();
    return RepoResult(data: packages);
  }
}
