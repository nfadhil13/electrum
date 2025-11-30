import 'package:equatable/equatable.dart';

class InterestFormEntity extends Equatable {
  final String bikeId;
  final DateTime preferredStartDate;
  final String pickUpArea;
  final String contact;

  const InterestFormEntity({
    required this.bikeId,
    required this.preferredStartDate,
    required this.pickUpArea,
    required this.contact,
  });

  @override
  List<Object?> get props => [bikeId, preferredStartDate, pickUpArea, contact];
}

