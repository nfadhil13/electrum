import 'package:electrum/features/bike/domain/entities/bike_interest.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest_form.dart';

abstract class BikeInterestNetworkDts {
  Future<BikeInterest> submitInterest(
    String userId,
    BikeInterestFormEntity interestForm,
  );
  Future<List<BikeInterest>> getInterests();
}

