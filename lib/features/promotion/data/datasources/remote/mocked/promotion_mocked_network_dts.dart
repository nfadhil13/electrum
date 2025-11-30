import 'package:electrum/core/env/environment.dart';
import 'package:electrum/features/promotion/data/datasources/promotion_network_dts.dart';
import 'package:electrum/features/promotion/domain/entities/promotion.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PromotionNetworkDts, env: [AppEnvironment.mocked])
class PromotionMockedNetworkDts implements PromotionNetworkDts {
  final List<Promotion> _promotions = [];

  PromotionMockedNetworkDts() {
    _promotions.addAll([
      Promotion(
        id: '1',
        title: 'Welcome Bonus: 20% Off First Rental',
        description:
            'New riders get 20% off their first monthly rental. Use code WELCOME20',
        validUntil: DateTime(2025, 12, 31),
      ),
      Promotion(
        id: '2',
        title: 'Weekend Special',
        description:
            'Rent for the weekend and get an extra day free. Available Fri-Mon',
        validUntil: DateTime(2025, 11, 30),
      ),
      Promotion(
        id: '3',
        title: 'Refer a Friend',
        description:
            'Both you and your friend get \$50 credit when they complete their first rental',
        validUntil: DateTime(2026, 12, 31),
      ),
    ]);
  }

  @override
  Future<List<Promotion>> getPromotions() async {
    return List.from(_promotions);
  }
}

