import 'package:electrum/core/ui/styles/style.dart';
import 'package:flutter/material.dart';

typedef FormFieldSaved<T> = void Function(T? value);

class ElectrumFormWrapper extends StatelessWidget {
  final String? label;
  final Widget child;

  const ElectrumFormWrapper({super.key, this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: textStyles.label.medium.applyColor(colors.onSurface),
          ),
          const SizedBox(height: 4),
        ],
        child,
      ],
    );
  }
}
