import 'package:electrum/core/types/image.dart';
import 'package:equatable/equatable.dart';

class Promotion extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime validUntil;
  final ElectrumImage image;

  const Promotion({
    required this.id,
    required this.title,
    required this.description,
    required this.validUntil,
    required this.image,
  });

  @override
  List<Object?> get props => [id, title, description, validUntil, image];
}
