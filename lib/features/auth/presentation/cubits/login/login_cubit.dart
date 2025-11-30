import 'package:bloc/bloc.dart';
import 'package:electrum/core/types/exception/base.dart';
import 'package:electrum/core/types/result.dart';
import 'package:electrum/features/auth/domain/entities/login_form.dart';
import 'package:electrum/features/auth/domain/entities/user.dart';
import 'package:electrum/features/auth/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _loginUsecase;

  LoginCubit(this._loginUsecase) : super(const LoginIdle());

  Future<void> login(LoginFormEntity form) async {
    emit(const LoginSubmitting());

    final result = await _loginUsecase(form);

    switch (result) {
      case Success(data: final user):
        emit(LoginSuccess(user));
      case Failure(exception: final exception):
        emit(
          LoginError(exception, {
            if (exception is FormException) ...exception.errors,
          }),
        );
    }
  }
}
