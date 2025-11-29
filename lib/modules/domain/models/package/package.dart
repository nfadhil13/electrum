import 'package:equatable/equatable.dart';

class Package extends Equatable {
  final String id;
  final String name;
  final String description;
  final double dailyPrice;
  final double weeklyPrice;
  final double monthlyPrice;
  final List<String> terms;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Package({
    required this.id,
    required this.name,
    required this.description,
    required this.dailyPrice,
    required this.weeklyPrice,
    required this.monthlyPrice,
    required this.terms,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        dailyPrice,
        weeklyPrice,
        monthlyPrice,
        terms,
        createdAt,
        updatedAt,
      ];
}

