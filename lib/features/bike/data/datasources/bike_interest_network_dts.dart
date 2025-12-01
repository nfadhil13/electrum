import 'package:electrum/features/bike/domain/entities/bike_interest.dart';

abstract class BikeInterestNetworkDts {
  Future<BikeInterest> submitInterest(BikeInterest interest);
  Future<List<BikeInterest>> getInterests();
}

