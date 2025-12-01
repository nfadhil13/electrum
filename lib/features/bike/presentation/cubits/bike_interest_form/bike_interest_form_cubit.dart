import 'package:bloc/bloc.dart';
import 'package:electrum/core/types/exception/base.dart';
import 'package:electrum/core/types/result.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest_form.dart';
import 'package:electrum/features/bike/domain/usecases/get_bike_by_id_usecase.dart';
import 'package:electrum/features/bike/domain/usecases/submit_bike_interest_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'bike_interest_form_state.dart';

@injectable
class BikeInterestFormCubit extends Cubit<BikeInterestFormState> {
  final SubmitBikeInterestUsecase _submitBikeInterestUsecase;
  final GetBikeByIdUsecase _getBikeByIdUsecase;

  BikeInterestFormCubit(
    this._submitBikeInterestUsecase,
    this._getBikeByIdUsecase,
  ) : super(const BikeInterestFormPreparing());

  Future<void> loadBike(String bikeId) async {
    emit(const BikeInterestFormPreparing());
    final result = await _getBikeByIdUsecase.execute(bikeId);
    switch (result) {
      case Success(data: final bike):
        emit(BikeInterestFormPreparingSuccess(bike: bike));
      case Failure(exception: final exception):
        emit(BikeInterestFormPreparingError(exception));
    }
  }

  Future<void> submitInterest(BikeInterestFormEntity form) async {
    final state = this.state;
    if (state is! BikeInterestFormPreparingSuccess) return;
    final bike = state.bike;
    emit(BikeInterestFormSubmitting(bike: bike));

    final result = await _submitBikeInterestUsecase.execute(form);

    switch (result) {
      case Success(data: final interest):
        emit(BikeInterestFormSuccess(bike: bike, interest: interest));
      case Failure(exception: final exception):
        emit(
          BikeInterestFormError(
            bike: bike,
            exception: exception,
            errors: {if (exception is FormException) ...exception.errors},
          ),
        );
    }
  }
}
