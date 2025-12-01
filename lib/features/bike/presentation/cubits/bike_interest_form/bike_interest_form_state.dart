part of 'bike_interest_form_cubit.dart';

sealed class BikeInterestFormState extends Equatable {
  const BikeInterestFormState();

  @override
  List<Object?> get props => [];

  bool get isLoading =>
      this is BikeInterestFormSubmitting || this is BikeInterestFormPreparing;
}

class BikeInterestFormPreparing extends BikeInterestFormState {
  const BikeInterestFormPreparing();
}

class BikeInterestFormPreparingError extends BikeInterestFormState {
  final BaseException exception;
  const BikeInterestFormPreparingError(this.exception);

  @override
  List<Object?> get props => [exception, super.props];
}

class BikeInterestFormPreparingSuccess extends BikeInterestFormState {
  final BikeEntity bike;
  const BikeInterestFormPreparingSuccess({required this.bike});

  @override
  List<Object?> get props => [bike, super.props];
}

class BikeInterestFormIdle extends BikeInterestFormPreparingSuccess {
  const BikeInterestFormIdle({required super.bike});
}

class BikeInterestFormSubmitting extends BikeInterestFormPreparingSuccess {
  const BikeInterestFormSubmitting({required super.bike});
}

class BikeInterestFormSuccess extends BikeInterestFormPreparingSuccess {
  final BikeInterestEntity interest;

  const BikeInterestFormSuccess({required super.bike, required this.interest});

  @override
  List<Object?> get props => [interest, super.props];
}

class BikeInterestFormError extends BikeInterestFormPreparingSuccess {
  final BaseException exception;
  final Map<String, String> errors;

  const BikeInterestFormError({
    required super.bike,
    required this.exception,
    required this.errors,
  });

  @override
  List<Object?> get props => [exception, errors, super.props];
}
