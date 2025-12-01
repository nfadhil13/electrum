import 'package:bloc/bloc.dart';
import 'package:electrum/core/types/exception/base.dart';
import 'package:electrum/core/types/result.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:electrum/features/bike/domain/usecases/get_bike_by_id_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'bike_detail_state.dart';

@injectable
class BikeDetailCubit extends Cubit<BikeDetailState> {
  final GetBikeByIdUsecase _getBikeByIdUsecase;

  BikeDetailCubit(this._getBikeByIdUsecase) : super(const BikeDetailLoading());

  Future<void> loadBike(String bikeId) async {
    emit(const BikeDetailLoading());

    final result = await _getBikeByIdUsecase(bikeId);

    switch (result) {
      case Success(data: final bike):
        emit(BikeDetailSuccess(bike));
      case Failure(exception: final exception):
        emit(BikeDetailError(exception));
    }
  }
}
