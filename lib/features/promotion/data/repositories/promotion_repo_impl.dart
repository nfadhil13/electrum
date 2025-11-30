import 'package:electrum/core/types/repo_result.dart';
import 'package:electrum/features/promotion/data/datasources/promotion_network_dts.dart';
import 'package:electrum/features/promotion/domain/entities/promotion.dart';
import 'package:electrum/features/promotion/domain/repositories/promotion_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PromotionRepo)
class PromotionRepoImpl implements PromotionRepo {
  final PromotionNetworkDts _promotionNetworkDts;

  PromotionRepoImpl(this._promotionNetworkDts);

  @override
  Future<RepoResult<List<Promotion>>> getPromotions() async {
    final promotions = await _promotionNetworkDts.getPromotions();
    return RepoResult(data: promotions);
  }
}
