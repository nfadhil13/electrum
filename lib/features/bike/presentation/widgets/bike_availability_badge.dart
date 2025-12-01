import 'package:electrum/core/localization/i18n/strings.g.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/features/bike/domain/entities/availability.dart';
import 'package:flutter/material.dart';

class BikeAvailabilityBadge extends StatelessWidget {
  final Availability availability;

  const BikeAvailabilityBadge({super.key, required this.availability});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final t = context.t;

    Color badgeColor;
    String label;
    IconData icon;

    switch (availability) {
      case Availability.available:
        badgeColor = colors.success;
        label = t.available;
        icon = Icons.check_circle;
        break;
      case Availability.limited:
        badgeColor = const Color(0xFFFFA500);
        label = t.limited;
        icon = Icons.warning;
        break;
      case Availability.unavailable:
        badgeColor = colors.error;
        label = t.unavailable;
        icon = Icons.cancel;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: colors.surface),
          const SizedBox(width: 4),
          Text(
            label,
            style: textStyles.p.regular
                .applyColor(colors.surface)
                .copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
