import 'package:electrum/core/types/image_flutter.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/buttons/filled_button.dart';
import 'package:electrum/features/bike/domain/entities/availability.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:flutter/material.dart';

class BikeCard extends StatelessWidget {
  final Bike bike;
  final VoidCallback? onTap;

  const BikeCard({super.key, required this.bike, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.outline, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image(
                      image: bike.image.provider,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: colors.surfaceVariant,
                          child: Icon(
                            Icons.image_not_supported,
                            color: colors.onSurfaceMuted,
                            size: 48,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: _AvailabilityBadge(
                    availability: bike.availability,
                    colors: colors,
                    textStyles: textStyles,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bike.name,
                    style: textStyles.h4.bold.applyColor(colors.onSurface),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.battery_charging_full,
                        size: 16,
                        color: colors.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Range: ${bike.rangeInKm.toStringAsFixed(0)} km',
                        style: textStyles.p
                            .applyColor(colors.onSurfaceMuted)
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    bike.description,
                    style: textStyles.p.applyColor(colors.onSurfaceMuted),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  ElectrumFilledButton(
                    text: 'View Details',
                    width: double.infinity,
                    onPressed: onTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvailabilityBadge extends StatelessWidget {
  final Availability availability;
  final AppColors colors;
  final AppTextStyles textStyles;

  const _AvailabilityBadge({
    required this.availability,
    required this.colors,
    required this.textStyles,
  });

  @override
  Widget build(BuildContext context) {
    Color badgeColor;
    String label;
    IconData icon;

    switch (availability) {
      case Availability.available:
        badgeColor = colors.success;
        label = 'Available';
        icon = Icons.check_circle;
        break;
      case Availability.limited:
        badgeColor = const Color(0xFFFFA500);
        label = 'Limited';
        icon = Icons.warning;
        break;
      case Availability.unavailable:
        badgeColor = colors.error;
        label = 'Unavailable';
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
