import 'package:electrum/core/session_handler/session.dart';
import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest_form.dart';
import 'package:electrum/features/bike/domain/repositories/bike_interest_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubmitBikeInterestUsecase
    extends Usecase<BikeInterestFormEntity, BikeInterestEntity> {
  final BikeInterestRepo _repo;
  SubmitBikeInterestUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<BikeInterestEntity>> execute(
    BikeInterestFormEntity params,
  ) async {
    final session = await requireSession();
    final userId = switch (session) {
      SessionMocked(:final userId) => userId,
    };
    return _repo.submitInterest(userId, params).asResource;
  }
}
