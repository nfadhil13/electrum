import 'package:electrum/core/localization/app_localizations.dart';
import 'package:electrum/core/ui/responsive/responsive.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/buttons/filled_button.dart';
import 'package:electrum/core/ui/widgets/buttons/text_button.dart';
import 'package:electrum/core/ui/widgets/form/form.dart';
import 'package:electrum/core/ui/widgets/form/textfield/password_field.dart';
import 'package:electrum/core/ui/widgets/form/textfield/textfield.dart';
import 'package:electrum/core/ui/widgets/layout/card_container.dart';
import 'package:electrum/features/auth/domain/entities/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final formContent = _FormContent();
    return Scaffold(
      backgroundColor: colors.background,
      body: BreakPointWidget(
        xs: ColoredBox(
          color: colors.surface,
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: formContent,
              ),
            ),
          ),
        ),
        sm: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElectrumCardContainer(maxWidth: 400, child: formContent),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormContent extends StatelessWidget {
  const _FormContent();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final textStyles = context.textStyles;
    final localizations = AppLocalizations.of(context)!;
    return ElectrumForm(
      initialData: LoginFormEntity(),
      onSubmit: (submitResult) {
        submitResult.setError({
          'email': submitResult.value.email,
          'password': submitResult.value.password,
        });
        submitResult.validate();
      },
      child: Builder(
        builder: (context) {
          final form = context.electrumForm<LoginFormEntity>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                localizations.welcomeBack,
                style: textStyles.h1.bold.applyColor(colors.onSurface),
              ),
              const SizedBox(height: 8),
              Text(
                localizations.signInToContinue,
                style: textStyles.p.applyColor(colors.onSurfaceMuted),
              ),
              const SizedBox(height: 32),
              ElectrumTextField(
                label: localizations.emailAddress,
                hint: localizations.emailPlaceholder,
                onSaved: (value) => form.value.email = value ?? '',
                keyboardType: TextInputType.emailAddress,
                validator: (value) => form.errors('email'),
              ),
              const SizedBox(height: 24),
              ElectrumPasswordField(
                label: localizations.password,
                onSaved: (value) => form.value.password = value ?? '',
                hint: "********",
                validator: (value) => form.errors('password'),
              ),
              const SizedBox(height: 32),
              ElectrumFilledButton(
                text: localizations.signIn,
                width: double.infinity,
                onPressed: () => form.submit(),
              ),
              const SizedBox(height: 24),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      localizations.dontHaveAccount,
                      style: textStyles.p.applyColor(colors.onSurface),
                    ),
                    const SizedBox(width: 4),
                    ElectrumTextButton(
                      text: localizations.createAccount,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
