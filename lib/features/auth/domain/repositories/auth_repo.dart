import 'package:electrum/core/types/nothing.dart';
import 'package:electrum/core/types/repo_result.dart';
import 'package:electrum/features/auth/domain/entities/login_form.dart';
import 'package:electrum/features/auth/domain/entities/register_form.dart';
import 'package:electrum/features/auth/domain/entities/user.dart';

abstract class AuthRepo {
  Future<RepoResult<UserEntity>> login(LoginFormEntity loginForm);
  Future<RepoResult<UserEntity>> register(RegisterFormEntity registerForm);
  Future<RepoResult<Nothing>> logout();
}
