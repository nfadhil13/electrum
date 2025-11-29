part of 'base.dart';

// ignore: constant_identifier_names
enum ApiErrorType { USER_NOT_FOUND, INVALID_PASSWORD, USER_ALREADY_EXISTS }

class ApiError extends BaseException {
  final int statusCode;

  const ApiError({required this.statusCode, required super.message})
    : super(knownException: KnownException.apiError);

  @override
  List<Object?> get props => [statusCode, message, knownException];
}
