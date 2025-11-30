import 'package:electrum/core/session_handler/session.dart';
import 'package:electrum/core/types/mapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class SessionMockedMapper implements JSONMapper<SessionMocked> {
  static const String userIdKey = 'userId';

  @override
  SessionMocked fromJson(dynamic json) {
    return SessionMocked(userId: json[userIdKey] as String);
  }

  @override
  Map<String, dynamic> toJson(SessionMocked object) {
    return {userIdKey: object.userId};
  }
}
