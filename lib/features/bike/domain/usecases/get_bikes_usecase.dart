import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/bike/domain/entities/availability.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:electrum/features/bike/domain/repositories/bike_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBikesUsecase extends Usecase<Availability?, List<BikeEntity>> {
  final BikeRepo _repo;
  GetBikesUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<List<BikeEntity>>> execute(Availability? params) =>
      _repo.getBikes(availability: params).asResource;
}
