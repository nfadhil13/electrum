import 'package:electrum/core/types/repo_result.dart';
import 'package:electrum/features/interest/domain/entities/interest.dart';
import 'package:electrum/features/interest/domain/entities/interest_form.dart';

abstract class InterestRepo {
  Future<RepoResult<Interest>> submitInterest(
    String userId,
    InterestFormEntity interestForm,
  );
  Future<RepoResult<List<Interest>>> getInterests();
}
