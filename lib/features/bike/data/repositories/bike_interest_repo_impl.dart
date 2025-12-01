import 'package:electrum/core/types/repo_result.dart';
import 'package:electrum/features/bike/data/datasources/bike_interest_network_dts.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest_form.dart';
import 'package:electrum/features/bike/domain/repositories/bike_interest_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BikeInterestRepo)
class BikeInterestRepoImpl implements BikeInterestRepo {
  final BikeInterestNetworkDts _bikeInterestNetworkDts;

  BikeInterestRepoImpl(this._bikeInterestNetworkDts);

  @override
  Future<RepoResult<BikeInterest>> submitInterest(
    String userId,
    BikeInterestFormEntity interestForm,
  ) async {
    final interest = BikeInterest(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      bikeId: interestForm.bikeId,
      preferedStartDate: interestForm.preferredStartDate,
      pickUpArea: interestForm.pickUpArea,
      contact: interestForm.contact,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final submittedInterest = await _bikeInterestNetworkDts.submitInterest(
      interest,
    );
    return RepoResult(data: submittedInterest);
  }

  @override
  Future<RepoResult<List<BikeInterest>>> getInterests() async {
    final interests = await _bikeInterestNetworkDts.getInterests();
    return RepoResult(data: interests);
  }
}
