import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/features/package/domain/entities/package.dart';
import 'package:flutter/material.dart';

class PackageCard extends StatelessWidget {
  final Package package;
  final bool isMostPopular;
  final VoidCallback? onTap;

  const PackageCard({
    super.key,
    required this.package,
    this.isMostPopular = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isMostPopular ? colors.primary : colors.outline,
            width: isMostPopular ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    package.name,
                    style: textStyles.h4.bold.applyColor(colors.onSurface),
                  ),
                ),
                if (isMostPopular)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Most Popular',
                      style: textStyles.p.regular
                          .applyColor(colors.onPrimary)
                          .copyWith(fontSize: 10),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            _PriceRow(
              label: 'Day',
              price: package.dailyPrice,
              colors: colors,
              textStyles: textStyles,
            ),
            const SizedBox(height: 8),
            _PriceRow(
              label: 'Week',
              price: package.weeklyPrice,
              colors: colors,
              textStyles: textStyles,
            ),
            const SizedBox(height: 8),
            _PriceRow(
              label: 'Month',
              price: package.monthlyPrice,
              colors: colors,
              textStyles: textStyles,
            ),
            const SizedBox(height: 16),
            ...package.terms.map(
              (term) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle, size: 16, color: colors.success),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        term,
                        style: textStyles.p
                            .applyColor(colors.onSurface)
                            .copyWith(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final double price;
  final AppColors colors;
  final AppTextStyles textStyles;

  const _PriceRow({
    required this.label,
    required this.price,
    required this.colors,
    required this.textStyles,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textStyles.p.applyColor(colors.onSurfaceMuted)),
        Text(
          '\$ ${price.toStringAsFixed(0)}',
          style: textStyles.p.bold.applyColor(colors.onSurface),
        ),
      ],
    );
  }
}
