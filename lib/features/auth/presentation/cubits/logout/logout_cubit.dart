import 'package:bloc/bloc.dart';
import 'package:electrum/core/types/exception/base.dart';
import 'package:electrum/core/types/result.dart';
import 'package:electrum/features/auth/domain/usecases/logout_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'logout_state.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUsecase _logoutUsecase;

  LogoutCubit(this._logoutUsecase) : super(const LogoutInitial());

  Future<void> logout() async {
    emit(const LogoutLoading());

    final result = await _logoutUsecase();

    switch (result) {
      case Success():
        emit(const LogoutSuccess());
      case Failure(exception: final exception):
        emit(LogoutError(exception));
    }
  }
}

