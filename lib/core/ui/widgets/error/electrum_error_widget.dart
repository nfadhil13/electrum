import 'package:electrum/core/localization/i18n/strings.g.dart';
import 'package:electrum/core/types/exception/base.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/buttons/filled_button.dart';
import 'package:flutter/material.dart';

class ElectrumErrorWidget extends StatelessWidget {
  final String? message;
  final BaseException? exception;
  final VoidCallback? onRetry;
  final IconData? icon;
  final bool isCenter;

  const ElectrumErrorWidget({
    super.key,
    this.message,
    this.exception,
    this.onRetry,
    this.icon,
    this.isCenter = true,
  }) : assert(
         message != null || exception != null,
         'Either message or exception must be provided',
       );

  factory ElectrumErrorWidget.fromMessage(
    String message, {
    VoidCallback? onRetry,
    IconData? icon,
    bool isCenter = true,
  }) {
    return ElectrumErrorWidget(
      message: message,
      onRetry: onRetry,
      icon: icon,
      isCenter: isCenter,
    );
  }

  factory ElectrumErrorWidget.fromException(
    BaseException exception, {
    VoidCallback? onRetry,
    bool isCenter = true,
  }) {
    return ElectrumErrorWidget(
      exception: exception,
      onRetry: onRetry,
      isCenter: isCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final t = context.t;

    final errorMessage = message ?? exception?.message ?? '';
    final errorIcon = icon ?? Icons.error_outline;

    Widget content = Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.error, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(errorIcon, color: colors.error, size: 48),
          const SizedBox(height: 16),
          Text(
            errorMessage,
            style: textStyles.p.applyColor(colors.onSurface),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 16),
            ElectrumFilledButton(text: t.retry, onPressed: onRetry),
          ],
        ],
      ),
    );

    if (isCenter) {
      return Center(child: content);
    }

    return content;
  }
}
