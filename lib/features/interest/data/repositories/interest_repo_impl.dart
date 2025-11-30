import 'package:electrum/core/types/repo_result.dart';
import 'package:electrum/features/interest/data/datasources/interest_network_dts.dart';
import 'package:electrum/features/interest/domain/entities/interest.dart';
import 'package:electrum/features/interest/domain/entities/interest_form.dart';
import 'package:electrum/features/interest/domain/repositories/interest_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: InterestRepo)
class InterestRepoImpl implements InterestRepo {
  final InterestNetworkDts _interestNetworkDts;

  InterestRepoImpl(this._interestNetworkDts);

  @override
  Future<RepoResult<Interest>> submitInterest(
    String userId,
    InterestFormEntity interestForm,
  ) async {
    final interest = Interest(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      bikeId: interestForm.bikeId,
      preferedStartDate: interestForm.preferredStartDate,
      pickUpArea: interestForm.pickUpArea,
      contact: interestForm.contact,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final submittedInterest = await _interestNetworkDts.submitInterest(
      interest,
    );
    return RepoResult(data: submittedInterest);
  }

  @override
  Future<RepoResult<List<Interest>>> getInterests() async {
    final interests = await _interestNetworkDts.getInterests();
    return RepoResult(data: interests);
  }
}
