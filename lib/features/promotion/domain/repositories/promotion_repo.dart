import 'package:electrum/core/types/repo_result.dart';
import 'package:electrum/features/promotion/domain/entities/promotion.dart';

abstract class PromotionRepo {
  Future<RepoResult<List<PromotionEntity>>> getPromotions();
}
