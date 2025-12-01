import 'package:electrum/core/env/environment.dart';
import 'package:electrum/core/session_handler/session.dart';
import 'package:electrum/core/types/exception/base.dart';
import 'package:electrum/features/bike/data/datasources/bike_interest_network_dts.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest_form.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BikeInterestNetworkDts, env: [AppEnvironment.mocked])
class BikeInterestMockedNetworkDts implements BikeInterestNetworkDts {
  final BikeInterestMockDB _bikeInterestMockDB;
  final SessionHandler _handler;
  BikeInterestMockedNetworkDts(this._bikeInterestMockDB, this._handler);

  @override
  Future<BikeInterest> submitInterest(
    String userId,
    BikeInterestFormEntity interestForm,
  ) async {
    // Form validation ensures these fields are not null
    final interest = BikeInterest(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      bikeId: interestForm.bikeId,
      preferedStartDate: interestForm.preferredStartDate!,
      pickUpArea: interestForm.pickUpArea!,
      contact: interestForm.contact!,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    _bikeInterestMockDB.interests.add(interest);
    return interest;
  }

  @override
  Future<List<BikeInterest>> getInterests() async {
    final session = await _handler.getSession();
    if (session == null) throw SessionExpiredException();
    return [
      ..._bikeInterestMockDB.interests,
    ].where((interest) => interest.userId == session.getUserId()).toList();
  }
}

@LazySingleton(env: [AppEnvironment.mocked])
class BikeInterestMockDB {
  final List<BikeInterest> interests = [];

  BikeInterestMockDB();
}
