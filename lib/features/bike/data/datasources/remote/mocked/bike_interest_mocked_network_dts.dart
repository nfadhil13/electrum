import 'package:electrum/core/env/environment.dart';
import 'package:electrum/features/bike/data/datasources/bike_interest_network_dts.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BikeInterestNetworkDts, env: [AppEnvironment.mocked])
class BikeInterestMockedNetworkDts implements BikeInterestNetworkDts {
  final List<BikeInterest> _interests = [];

  @override
  Future<BikeInterest> submitInterest(BikeInterest interest) async {
    _interests.add(interest);
    return interest;
  }

  @override
  Future<List<BikeInterest>> getInterests() async {
    return List.from(_interests);
  }
}
