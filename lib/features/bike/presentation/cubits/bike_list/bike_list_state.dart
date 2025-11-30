part of 'bike_list_cubit.dart';

sealed class BikeListState extends Equatable {
  const BikeListState();

  @override
  List<Object?> get props => [];

  bool get isLoading => this is BikeListLoading;
}

class BikeListInitial extends BikeListState {
  const BikeListInitial();
}

class BikeListLoading extends BikeListState {
  const BikeListLoading();
}

class BikeListSuccess extends BikeListState {
  final List<Bike> bikes;

  const BikeListSuccess(this.bikes);

  @override
  List<Object?> get props => [bikes];
}

class BikeListError extends BikeListState {
  final BaseException exception;

  const BikeListError(this.exception);

  @override
  List<Object?> get props => [exception];
}
