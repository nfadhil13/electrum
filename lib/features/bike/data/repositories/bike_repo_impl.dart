import 'package:electrum/core/types/repo_result.dart';
import 'package:electrum/features/bike/data/datasources/bike_network_dts.dart';
import 'package:electrum/features/bike/domain/entities/availability.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:electrum/features/bike/domain/repositories/bike_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BikeRepo)
class BikeRepoImpl implements BikeRepo {
  final BikeNetworkDts _bikeNetworkDts;

  BikeRepoImpl(this._bikeNetworkDts);

  @override
  Future<RepoResult<List<BikeEntity>>> getBikes({
    Availability? availability,
  }) async {
    final bikes = await _bikeNetworkDts.getBikes(availability: availability);
    return RepoResult(data: bikes);
  }

  @override
  Future<RepoResult<BikeDetailEntity>> getBikeById(String id) async {
    final bike = await _bikeNetworkDts.getBikeById(id);
    return RepoResult(data: bike);
  }
}
