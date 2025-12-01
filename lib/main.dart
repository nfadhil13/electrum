import 'package:electrum/core/env/environment.dart';
import 'package:electrum/core/localization/i18n/strings.g.dart';
import 'package:electrum/core/router/router.dart';
import 'package:electrum/core/service_locator/service_locator.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies(AppEnvironment.mocked);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: Builder(
        builder: (context) {
          final t = context.t;
          return MaterialApp.router(
            title: t.appTitle,
            routerConfig: AppRouter.router,

            supportedLocales: AppLocaleUtils.supportedLocales,
            locale: TranslationProvider.of(context).flutterLocale,
            builder: (context, child) =>
                ElectrumStyleProvider(child: child ?? const SizedBox()),
          );
        },
      ),
    );
  }
}
