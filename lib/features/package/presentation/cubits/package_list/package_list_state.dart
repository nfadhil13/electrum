part of 'package_list_cubit.dart';

sealed class PackageListState extends Equatable {
  const PackageListState();

  @override
  List<Object?> get props => [];

  bool get isLoading => this is PackageListLoading;
}

class PackageListInitial extends PackageListState {
  const PackageListInitial();
}

class PackageListLoading extends PackageListState {
  const PackageListLoading();
}

class PackageListSuccess extends PackageListState {
  final List<Package> packages;

  const PackageListSuccess(this.packages);

  @override
  List<Object?> get props => [packages];
}

class PackageListError extends PackageListState {
  final BaseException exception;

  const PackageListError(this.exception);

  @override
  List<Object?> get props => [exception];
}
