part of 'bike_list_cubit.dart';

sealed class BikeListState extends Equatable {
  const BikeListState();

  @override
  List<Object?> get props => [];

  bool get isLoading => this is BikeListLoading;
}

class BikeListLoading extends BikeListState {
  const BikeListLoading();
}

class BikeListSuccess extends BikeListState {
  final List<BikeEntity> bikes;

  const BikeListSuccess(this.bikes);

  @override
  List<Object?> get props => [bikes];
}

class BikeListError extends BikeListState {
  final BaseException exception;
  final void Function() onRetry;

  const BikeListError(this.exception, {required this.onRetry});

  @override
  List<Object?> get props => [exception, onRetry];
}
