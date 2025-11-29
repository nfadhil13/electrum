import 'package:electrum/core/types/image.dart';
import 'package:equatable/equatable.dart';
import 'availability.dart';

class Bike extends Equatable {
  final String id;
  final String name;
  final ElectrumImage image;
  final double rangeInKm;
  final double topSpeedInKmH;
  final double chargingTimeInHours;
  final double weightInKg;
  final double motorPowerInKw;
  final Availability availability;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Bike({
    required this.id,
    required this.name,
    required this.image,
    required this.rangeInKm,
    required this.topSpeedInKmH,
    required this.chargingTimeInHours,
    required this.weightInKg,
    required this.motorPowerInKw,
    required this.availability,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    rangeInKm,
    topSpeedInKmH,
    chargingTimeInHours,
    weightInKg,
    motorPowerInKw,
    availability,
    description,
    createdAt,
    updatedAt,
  ];
}
