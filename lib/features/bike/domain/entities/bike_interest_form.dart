import 'package:equatable/equatable.dart';

class BikeInterestFormEntity extends Equatable {
  final String bikeId;
  final DateTime preferredStartDate;
  final String pickUpArea;
  final String contact;

  const BikeInterestFormEntity({
    required this.bikeId,
    required this.preferredStartDate,
    required this.pickUpArea,
    required this.contact,
  });

  @override
  List<Object?> get props => [bikeId, preferredStartDate, pickUpArea, contact];
}

