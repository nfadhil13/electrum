import 'package:electrum/features/package/domain/entities/package.dart';

abstract class PackageNetworkDts {
  Future<List<Package>> getPackages();
}

