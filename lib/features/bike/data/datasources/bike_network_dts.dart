import 'package:electrum/features/bike/domain/entities/availability.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';

abstract class BikeNetworkDts {
  Future<List<Bike>> getBikes({Availability? availability});
  Future<Bike> getBikeById(String id);
}
