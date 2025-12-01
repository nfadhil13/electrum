import 'package:electrum/core/types/repo_result.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest_form.dart';

abstract class BikeInterestRepo {
  Future<RepoResult<BikeInterestEntity>> submitInterest(
    String userId,
    BikeInterestFormEntity interestForm,
  );
  Future<RepoResult<List<BikeInterestEntity>>> getInterests();
}
