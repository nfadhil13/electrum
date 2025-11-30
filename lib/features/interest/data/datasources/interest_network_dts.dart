import 'package:electrum/features/interest/domain/entities/interest.dart';

abstract class InterestNetworkDts {
  Future<Interest> submitInterest(Interest interest);
  Future<List<Interest>> getInterests();
}

