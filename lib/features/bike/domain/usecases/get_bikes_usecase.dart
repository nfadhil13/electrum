import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:electrum/features/bike/domain/repositories/bike_repo.dart';

class GetBikesUsecase extends UsecaseNoParams<List<Bike>> {
  final BikeRepo _repo;
  GetBikesUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<List<Bike>>> execute() => _repo.getBikes().asResource;
}

