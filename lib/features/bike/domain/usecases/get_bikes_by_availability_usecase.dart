import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/bike/domain/entities/availability.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:electrum/features/bike/domain/repositories/bike_repo.dart';

class GetBikesByAvailabilityUsecase extends Usecase<Availability, List<Bike>> {
  final BikeRepo _repo;
  GetBikesByAvailabilityUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<List<Bike>>> execute(Availability params) =>
      _repo.getBikes(availability: params).asResource;
}

