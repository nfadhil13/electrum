import 'package:bloc/bloc.dart';
import 'package:electrum/core/types/exception/base.dart';
import 'package:electrum/core/types/result.dart';
import 'package:electrum/features/package/domain/entities/package.dart';
import 'package:electrum/features/package/domain/usecases/get_packages_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'package_list_state.dart';

@injectable
class PackageListCubit extends Cubit<PackageListState> {
  final GetPackagesUsecase _getPackagesUsecase;

  PackageListCubit(this._getPackagesUsecase)
    : super(const PackageListInitial());

  Future<void> loadPackages() async {
    emit(const PackageListLoading());

    final result = await _getPackagesUsecase();

    switch (result) {
      case Success(data: final packages):
        emit(PackageListSuccess(packages));
      case Failure(exception: final exception):
        emit(PackageListError(exception));
    }
  }
}
