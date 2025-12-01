import 'package:electrum/core/env/environment.dart';
import 'package:electrum/core/types/image.dart';
import 'package:electrum/features/promotion/data/datasources/promotion_network_dts.dart';
import 'package:electrum/features/promotion/domain/entities/promotion.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PromotionNetworkDts, env: [AppEnvironment.mocked])
class PromotionMockedNetworkDts implements PromotionNetworkDts {
  final PromotionMockDB _promotionMockDB;
  PromotionMockedNetworkDts(this._promotionMockDB);

  @override
  Future<List<PromotionEntity>> getPromotions() async {
    return _promotionMockDB.promotions;
  }
}

@LazySingleton(env: [AppEnvironment.mocked])
class PromotionMockDB {
  final List<PromotionEntity> _promotions = [];

  PromotionMockDB() {
    _promotions.addAll([
      PromotionEntity(
        id: '1',
        title: 'Welcome Bonus: 20% Off First Rental',
        description:
            'New riders get 20% off their first monthly rental. Use code WELCOME20',
        validUntil: DateTime(2025, 12, 31),
        image: ElectrumImageNetwork(
          url:
              'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
        ),
      ),
      PromotionEntity(
        id: '2',
        title: 'Weekend Special',
        description:
            'Rent for the weekend and get an extra day free. Available Fri-Mon',
        validUntil: DateTime(2025, 11, 30),
        image: ElectrumImageNetwork(
          url:
              'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=800',
        ),
      ),
      PromotionEntity(
        id: '3',
        title: 'Refer a Friend',
        description:
            'Both you and your friend get \$50 credit when they complete their first rental',
        validUntil: DateTime(2026, 12, 31),
        image: ElectrumImageNetwork(
          url:
              'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
        ),
      ),
    ]);
  }

  List<PromotionEntity> get promotions => List.from(_promotions);
}
