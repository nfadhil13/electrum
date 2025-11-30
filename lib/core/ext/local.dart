import 'package:electrum/core/localization/generated/strings.g.dart';
import 'package:flutter/material.dart';

extension LocalExtension on BuildContext {
  Translations get translations => Translations.of(this);
  String localizeMessage(String key) {
    final translations = Translations.of(this);
    return translations[key] ?? key;
  }
}
