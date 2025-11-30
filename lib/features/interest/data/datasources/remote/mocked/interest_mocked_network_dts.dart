import 'package:electrum/core/env/environment.dart';
import 'package:electrum/features/interest/data/datasources/interest_network_dts.dart';
import 'package:electrum/features/interest/domain/entities/interest.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: InterestNetworkDts, env: [AppEnvironment.mocked])
class InterestMockedNetworkDts implements InterestNetworkDts {
  final List<Interest> _interests = [];

  @override
  Future<Interest> submitInterest(Interest interest) async {
    _interests.add(interest);
    return interest;
  }

  @override
  Future<List<Interest>> getInterests() async {
    return List.from(_interests);
  }
}

