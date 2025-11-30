import 'package:electrum/core/env/environment.dart';
import 'package:electrum/core/types/image.dart';
import 'package:electrum/features/bike/data/datasources/bike_network_dts.dart';
import 'package:electrum/features/bike/domain/entities/availability.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BikeNetworkDts, env: [AppEnvironment.mocked])
class BikeMockedNetworkDts implements BikeNetworkDts {
  final List<Bike> _bikes = [];

  BikeMockedNetworkDts() {
    _bikes.addAll([
      Bike(
        id: '1',
        name: 'Electrum X1',
        image: ElectrumImageNetwork(
          url:
              'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=800',
        ),
        rangeInKm: 120,
        topSpeedInKmH: 45,
        chargingTimeInHours: 4,
        weightInKg: 25,
        motorPowerInKw: 0.75,
        availability: Availability.available,
        description:
            'The perfect city commuter with sleek design and reliable performance. Ideal for daily rides and urban exploration.',
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        updatedAt: DateTime.now(),
      ),
      Bike(
        id: '2',
        name: 'Electrum Pro',
        image: ElectrumImageNetwork(
          url:
              'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
        ),
        rangeInKm: 150,
        topSpeedInKmH: 50,
        chargingTimeInHours: 5,
        weightInKg: 28,
        motorPowerInKw: 1.0,
        availability: Availability.available,
        description:
            'Premium performance with extended range. Perfect for longer commutes and weekend adventures.',
        createdAt: DateTime.now().subtract(const Duration(days: 25)),
        updatedAt: DateTime.now(),
      ),
      Bike(
        id: '3',
        name: 'Electrum Sport',
        image: ElectrumImageNetwork(
          url:
              'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=800',
        ),
        rangeInKm: 100,
        topSpeedInKmH: 40,
        chargingTimeInHours: 3,
        weightInKg: 22,
        motorPowerInKw: 0.5,
        availability: Availability.limited,
        description:
            'Lightweight and agile, designed for urban riders who value speed and maneuverability.',
        createdAt: DateTime.now().subtract(const Duration(days: 20)),
        updatedAt: DateTime.now(),
      ),
      Bike(
        id: '4',
        name: 'Electrum Tour',
        image: ElectrumImageNetwork(
          url:
              'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
        ),
        rangeInKm: 180,
        topSpeedInKmH: 45,
        chargingTimeInHours: 6,
        weightInKg: 30,
        motorPowerInKw: 1.2,
        availability: Availability.available,
        description:
            'Built for long-distance touring with exceptional range and comfort features.',
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
        updatedAt: DateTime.now(),
      ),
      Bike(
        id: '5',
        name: 'Electrum Compact',
        image: ElectrumImageNetwork(
          url:
              'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=800',
        ),
        rangeInKm: 80,
        topSpeedInKmH: 35,
        chargingTimeInHours: 2.5,
        weightInKg: 18,
        motorPowerInKw: 0.4,
        availability: Availability.unavailable,
        description:
            'Compact and foldable, perfect for city dwellers with limited storage space.',
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        updatedAt: DateTime.now(),
      ),
    ]);
  }

  @override
  Future<List<Bike>> getBikes({Availability? availability}) async {
    if (availability == null) {
      return List.from(_bikes);
    }
    return _bikes.where((bike) => bike.availability == availability).toList();
  }

  @override
  Future<Bike> getBikeById(String id) async {
    final bike = _bikes.firstWhere(
      (bike) => bike.id == id,
      orElse: () => throw Exception('Bike not found'),
    );
    return bike;
  }
}

