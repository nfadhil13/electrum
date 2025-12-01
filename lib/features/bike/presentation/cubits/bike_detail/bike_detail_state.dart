part of 'bike_detail_cubit.dart';

sealed class BikeDetailState extends Equatable {
  const BikeDetailState();

  @override
  List<Object?> get props => [];
}

class BikeDetailLoading extends BikeDetailState {
  const BikeDetailLoading();
}

class BikeDetailSuccess extends BikeDetailState {
  final BikeDetailEntity bike;

  const BikeDetailSuccess(this.bike);

  @override
  List<Object?> get props => [bike];
}

class BikeDetailRefreshing extends BikeDetailSuccess {
  const BikeDetailRefreshing(super.bike);
}

class BikeDetailError extends BikeDetailState {
  final BaseException exception;

  const BikeDetailError(this.exception);

  @override
  List<Object?> get props => [exception];
}
