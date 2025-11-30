import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:electrum/features/bike/domain/repositories/bike_repo.dart';

class GetBikeByIdUsecase extends Usecase<String, Bike> {
  final BikeRepo _repo;
  GetBikeByIdUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<Bike>> execute(String params) =>
      _repo.getBikeById(params).asResource;
}

