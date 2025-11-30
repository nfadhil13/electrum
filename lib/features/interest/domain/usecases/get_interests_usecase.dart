import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/interest/domain/entities/interest.dart';
import 'package:electrum/features/interest/domain/repositories/interest_repo.dart';

class GetInterestsUsecase extends UsecaseNoParams<List<Interest>> {
  final InterestRepo _repo;
  GetInterestsUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<List<Interest>>> execute() => _repo.getInterests().asResource;
}
