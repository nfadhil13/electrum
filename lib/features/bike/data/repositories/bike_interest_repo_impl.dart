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
    final submittedInterest = await _bikeInterestNetworkDts.submitInterest(
      userId,
      interestForm,
    );
    return RepoResult(data: submittedInterest);
  }

  @override
  Future<RepoResult<List<BikeInterest>>> getInterests() async {
    final interests = await _bikeInterestNetworkDts.getInterests();
    return RepoResult(data: interests);
  }
}
