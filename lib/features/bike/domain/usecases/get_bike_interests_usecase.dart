import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest.dart';
import 'package:electrum/features/bike/domain/repositories/bike_interest_repo.dart';

class GetBikeInterestsUsecase extends UsecaseNoParams<List<BikeInterest>> {
  final BikeInterestRepo _repo;
  GetBikeInterestsUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<List<BikeInterest>>> execute() =>
      _repo.getInterests().asResource;
}

