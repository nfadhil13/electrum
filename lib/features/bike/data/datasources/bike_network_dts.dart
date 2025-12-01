import 'package:electrum/features/bike/domain/entities/availability.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';

abstract class BikeNetworkDts {
  Future<List<BikeEntity>> getBikes({Availability? availability});
  Future<BikeDetailEntity> getBikeById(String id);
}
