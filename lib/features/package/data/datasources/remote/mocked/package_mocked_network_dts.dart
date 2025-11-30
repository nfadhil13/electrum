import 'package:electrum/core/env/environment.dart';
import 'package:electrum/features/package/data/datasources/package_network_dts.dart';
import 'package:electrum/features/package/domain/entities/package.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PackageNetworkDts, env: [AppEnvironment.mocked])
class PackageMockedNetworkDts implements PackageNetworkDts {
  final List<Package> _packages = [];

  PackageMockedNetworkDts() {
    _packages.addAll([
      Package(
        id: '1',
        name: 'Basic Ride',
        description: 'Perfect for occasional riders',
        dailyPrice: 25,
        weeklyPrice: 150,
        monthlyPrice: 500,
        terms: [
          'Insurance included',
          'Free helmet',
          'Basic maintenance',
          '100km daily limit',
        ],
        createdAt: DateTime.now().subtract(const Duration(days: 60)),
        updatedAt: DateTime.now(),
      ),
      Package(
        id: '2',
        name: 'Premium Plus',
        description: 'Most popular choice for regular riders',
        dailyPrice: 35,
        weeklyPrice: 220,
        monthlyPrice: 750,
        terms: [
          'Full insurance coverage',
          'Premium helmet & gear',
          'Priority maintenance',
          '24/7 roadside assistance',
        ],
        createdAt: DateTime.now().subtract(const Duration(days: 50)),
        updatedAt: DateTime.now(),
      ),
      Package(
        id: '3',
        name: 'Enterprise Fleet',
        description: 'Designed for businesses and teams',
        dailyPrice: 30,
        weeklyPrice: 180,
        monthlyPrice: 600,
        terms: [
          'Multi-bike discounts',
          'Dedicated account manager',
          'Flexible billing',
          'Corporate insurance',
          'Fleet management tools',
        ],
        createdAt: DateTime.now().subtract(const Duration(days: 40)),
        updatedAt: DateTime.now(),
      ),
    ]);
  }

  @override
  Future<List<Package>> getPackages() async {
    return List.from(_packages);
  }
}

