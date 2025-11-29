import 'package:equatable/equatable.dart';

class Promotion extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime validUntil;

  const Promotion({
    required this.id,
    required this.title,
    required this.description,
    required this.validUntil,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        validUntil,
      ];
}

