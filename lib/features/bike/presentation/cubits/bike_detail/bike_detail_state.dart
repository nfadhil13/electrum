part of 'bike_detail_cubit.dart';

sealed class BikeDetailState extends Equatable {
  const BikeDetailState();

  @override
  List<Object?> get props => [];

  bool get isLoading => this is BikeDetailLoading;
}

class BikeDetailInitial extends BikeDetailState {
  const BikeDetailInitial();
}

class BikeDetailLoading extends BikeDetailState {
  const BikeDetailLoading();
}

class BikeDetailSuccess extends BikeDetailState {
  final Bike bike;

  const BikeDetailSuccess(this.bike);

  @override
  List<Object?> get props => [bike];
}

class BikeDetailError extends BikeDetailState {
  final BaseException exception;

  const BikeDetailError(this.exception);

  @override
  List<Object?> get props => [exception];
}

