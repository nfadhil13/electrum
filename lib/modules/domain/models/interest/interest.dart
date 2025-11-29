import 'package:equatable/equatable.dart';

class Interest extends Equatable {
  final String id;
  final String userId;
  final String bikeId;
  final DateTime preferedStartDate;
  final String pickUpArea;
  final String contact;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Interest({
    required this.id,
    required this.userId,
    required this.bikeId,
    required this.preferedStartDate,
    required this.pickUpArea,
    required this.contact,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        bikeId,
        preferedStartDate,
        pickUpArea,
        contact,
        createdAt,
        updatedAt,
      ];
}

