import 'package:electrum/features/promotion/domain/entities/promotion.dart';

abstract class PromotionNetworkDts {
  Future<List<Promotion>> getPromotions();
}

