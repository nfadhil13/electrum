part of 'base.dart';

class SessionExpiredException extends BaseException {
  SessionExpiredException()
    : super(
        message: KnownException.sessionExpired.name,
        knownException: KnownException.sessionExpired,
      );
}
