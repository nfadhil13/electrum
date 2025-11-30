import 'package:electrum/core/session_handler/session.dart';
import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/interest/domain/entities/interest.dart';
import 'package:electrum/features/interest/domain/entities/interest_form.dart';
import 'package:electrum/features/interest/domain/repositories/interest_repo.dart';

class SubmitInterestUsecase extends Usecase<InterestFormEntity, Interest> {
  final InterestRepo _repo;
  SubmitInterestUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<Interest>> execute(InterestFormEntity params) async {
    final session = await requireSession();
    final userId = switch (session) {
      SessionMocked(:final userId) => userId,
    };
    return _repo.submitInterest(userId, params).asResource;
  }
}

