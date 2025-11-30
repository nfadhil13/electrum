import 'package:electrum/core/ext/local.dart';
import 'package:electrum/core/router/router.dart';
import 'package:electrum/core/localization/generated/strings.g.dart';
import 'package:electrum/core/service_locator/service_locator.dart';
import 'package:electrum/core/ui/messenger/messenger.dart';
import 'package:electrum/core/ui/responsive/responsive.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/buttons/filled_button.dart';
import 'package:electrum/core/ui/widgets/buttons/text_button.dart';
import 'package:electrum/core/ui/widgets/form/form.dart';
import 'package:electrum/core/ui/widgets/form/textfield/password_field.dart';
import 'package:electrum/core/ui/widgets/form/textfield/textfield.dart';
import 'package:electrum/core/ui/widgets/layout/card_container.dart';
import 'package:electrum/core/ui/widgets/layout/loading_container.dart';
import 'package:electrum/core/ui/widgets/wrapper/bloc_provider_wrapper.dart';
import 'package:electrum/features/auth/domain/entities/login_form.dart';
import 'package:electrum/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends BlocProviderWrapper<LoginCubit> {
  const LoginPage({super.key});

  @override
  Widget buildChild(BuildContext context, LoginCubit bloc) {
    final colors = context.colors;
    final formContent = _FormContent();
    return ElectrumLoadingContainer(
      initialValue: bloc.state.isLoading,
      isLoadingStream: bloc.stream.map((state) => state.isLoading),
      child: Scaffold(
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
      ),
    );
  }

  @override
  LoginCubit createBloc(BuildContext context) => getIt<LoginCubit>();
}

class _FormContent extends StatelessWidget {
  const _FormContent();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final loginCubit = context.read<LoginCubit>();
    final textStyles = context.textStyles;
    final t = Translations.of(context);
    return ElectrumForm(
      initialData: LoginFormEntity(),
      onSubmit: (submitResult) {
        loginCubit.login(submitResult.value);
      },
      child: Builder(
        builder: (context) {
          final form = context.electrumForm<LoginFormEntity>();
          return BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                context.showSuccessSnackbar(context.translations.loginSuccess);
              }
              if (state is LoginError) {
                form.setError(state.errors);
                context.showErrorSnackbar(
                  context.localizeMessage(state.exception.message),
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  t.welcomeBack,
                  style: textStyles.h1.bold.applyColor(colors.onSurface),
                ),
                const SizedBox(height: 8),
                Text(
                  t.signInToContinue,
                  style: textStyles.p.applyColor(colors.onSurfaceMuted),
                ),
                const SizedBox(height: 32),
                ElectrumTextField(
                  label: t.emailAddress,
                  hint: t.emailPlaceholder,
                  onSaved: (value) => form.value.email = value ?? '',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => form.errors('email'),
                ),
                const SizedBox(height: 24),
                ElectrumPasswordField(
                  label: t.password,
                  onSaved: (value) => form.value.password = value ?? '',
                  hint: "********",
                  validator: (value) => form.errors('password'),
                ),
                const SizedBox(height: 32),
                ElectrumFilledButton(
                  text: t.signIn,
                  width: double.infinity,
                  onPressed: () => form.submit(),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        t.dontHaveAccount,
                        style: textStyles.p.applyColor(colors.onSurface),
                      ),
                      const SizedBox(width: 4),
                      ElectrumTextButton(
                        text: t.createAccount,
                        onPressed: () => context.push(AppRoutes.register),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
