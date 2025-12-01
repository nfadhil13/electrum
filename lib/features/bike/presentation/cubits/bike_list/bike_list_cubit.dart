import 'package:bloc/bloc.dart';
import 'package:electrum/core/types/exception/base.dart';
import 'package:electrum/core/types/result.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:electrum/features/bike/domain/usecases/get_bikes_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'bike_list_state.dart';

@injectable
class BikeListCubit extends Cubit<BikeListState> {
  final GetBikesUsecase _getBikesUsecase;

  BikeListCubit(this._getBikesUsecase) : super(const BikeListLoading());

  Future<void> loadBikes() async {
    emit(const BikeListLoading());

    final result = await _getBikesUsecase();

    switch (result) {
      case Success(data: final bikes):
        emit(BikeListSuccess(bikes));
      case Failure(exception: final exception):
        emit(BikeListError(exception));
    }
  }
}
