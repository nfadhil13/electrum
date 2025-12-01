import 'package:electrum/core/localization/i18n/strings.g.dart';
import 'package:electrum/core/types/image_flutter.dart';
import 'package:electrum/core/ui/responsive/responsive.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/buttons/filled_button.dart';
import 'package:electrum/core/ui/widgets/buttons/text_button.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:electrum/features/bike/presentation/widgets/bike_availability_badge.dart';
import 'package:flutter/material.dart';

class BikeCard extends StatelessWidget {
  final BikeEntity bike;
  final VoidCallback? onTap;

  const BikeCard({super.key, required this.bike, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final t = context.t;

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
                  child: BikeAvailabilityBadge(availability: bike.availability),
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
                        '${t.range}: ${bike.rangeInKm.toStringAsFixed(0)} km',
                        style: textStyles.p
                            .applyColor(colors.onSurfaceMuted)
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      bike.description,
                      style: textStyles.p.applyColor(colors.onSurfaceMuted),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 16),
                  BreakPointWidget(
                    xs: Align(
                      alignment: Alignment.center,
                      child: ElectrumTextButton(
                        text: t.viewDetails,
                        onPressed: onTap,
                      ),
                    ),
                    sm: ElectrumFilledButton(
                      text: t.viewDetails,
                      width: double.infinity,
                      onPressed: onTap,
                    ),
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
