part of '../home_page.dart';

class _RentalPackagesSection extends StatelessWidget {
  const _RentalPackagesSection();

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;
    final t = context.t;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.rentalPackages,
          style: textStyles.h3.bold.applyColor(colors.onSurface),
        ),
        const SizedBox(height: 8),
        Text(
          t.rentalPackagesDescription,
          style: textStyles.p.applyColor(colors.onSurfaceMuted),
        ),
        const SizedBox(height: 16),
        const PackageStatefulGrid(),
      ],
    );
  }
}
