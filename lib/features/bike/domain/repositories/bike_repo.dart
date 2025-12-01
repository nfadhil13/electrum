import 'package:electrum/core/types/repo_result.dart';
import 'package:electrum/features/bike/domain/entities/availability.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';

abstract class BikeRepo {
  Future<RepoResult<List<BikeEntity>>> getBikes({Availability? availability});
  Future<RepoResult<BikeDetailEntity>> getBikeById(String id);
}
