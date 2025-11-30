import 'package:electrum/core/types/result.dart';
import 'package:electrum/core/types/usecase.dart';
import 'package:electrum/features/promotion/domain/entities/promotion.dart';
import 'package:electrum/features/promotion/domain/repositories/promotion_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPromotionsUsecase extends UsecaseNoParams<List<Promotion>> {
  final PromotionRepo _repo;
  GetPromotionsUsecase(super.sessionHandler, this._repo);

  @override
  Future<Resource<List<Promotion>>> execute() =>
      _repo.getPromotions().asResource;
}
