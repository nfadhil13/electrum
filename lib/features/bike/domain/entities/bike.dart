import 'package:electrum/core/types/image.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest.dart';
import 'package:equatable/equatable.dart';
import 'availability.dart';

class BikeEntity extends Equatable {
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

  const BikeEntity({
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

class BikeDetailEntity extends BikeEntity {
  final BikeInterestEntity? interest;

  BikeDetailEntity.fromBikeEntity(BikeEntity bike, this.interest)
    : super(
        id: bike.id,
        name: bike.name,
        image: bike.image,
        rangeInKm: bike.rangeInKm,
        topSpeedInKmH: bike.topSpeedInKmH,
        chargingTimeInHours: bike.chargingTimeInHours,
        weightInKg: bike.weightInKg,
        motorPowerInKw: bike.motorPowerInKw,
        availability: bike.availability,
        description: bike.description,
        createdAt: bike.createdAt,
        updatedAt: bike.updatedAt,
      );

  const BikeDetailEntity({
    required super.id,
    required super.name,
    required super.image,
    required super.rangeInKm,
    required super.topSpeedInKmH,
    required super.chargingTimeInHours,
    required super.weightInKg,
    required super.motorPowerInKw,
    required super.availability,
    required super.description,
    required super.createdAt,
    required super.updatedAt,
    this.interest,
  });

  @override
  List<Object?> get props => [super.props, interest];
}
