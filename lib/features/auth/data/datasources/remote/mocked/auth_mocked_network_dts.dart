import 'package:electrum/core/env/environment.dart';
import 'package:electrum/core/types/exception/base.dart';
import 'package:electrum/features/auth/data/datasources/auth_network_dts.dart';
import 'package:electrum/features/auth/domain/entities/login_form.dart';
import 'package:electrum/features/auth/domain/entities/register_form.dart';
import 'package:electrum/features/auth/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthNetworkDts, env: [AppEnvironment.mocked])
class AuthMockedNetworkDts implements AuthNetworkDts {
  final Map<String, UserEntity> users = {};

  AuthMockedNetworkDts() {
    users['test@test.com'] = UserEntity(
      id: '1',
      fullName: 'Test User',
      email: 'test@test.com',
      password: 'test',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    users['test2@test.com'] = UserEntity(
      id: '2',
      fullName: 'Test User 2',
      email: 'test2@test.com',
      password: 'test2',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
  @override
  Future<UserEntity> login(LoginFormEntity loginForm) async {
    await Future.delayed(const Duration(seconds: 2));
    final user = users[loginForm.email];
    if (user == null) {
      throw ApiError(statusCode: 404, message: ApiErrorType.userNotFound.name);
    }
    if (loginForm.password != user.password) {
      throw ApiError(
        statusCode: 401,
        message: ApiErrorType.invalidPassword.name,
      );
    }
    return user;
  }

  @override
  Future<void> logout() {
    return Future.value();
  }

  @override
  Future<UserEntity> register(RegisterFormEntity registerForm) {
    if (users.containsKey(registerForm.email)) {
      throw ApiError(
        statusCode: 400,
        message: ApiErrorType.userAlreadyExists.name,
      );
    }
    final user = UserEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fullName: registerForm.fullName,
      email: registerForm.email,
      password: registerForm.password,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    users[registerForm.email] = user;
    return Future.value(user);
  }
}
