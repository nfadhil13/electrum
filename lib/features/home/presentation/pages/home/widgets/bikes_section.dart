part of '../home_page.dart';

class _BikesSection extends StatelessWidget {
  const _BikesSection();

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;
    final t = context.t;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.electrumBikes,
          style: textStyles.h3.bold.applyColor(colors.onSurface),
        ),
        const SizedBox(height: 8),
        Text(
          t.electrumBikesDescription,
          style: textStyles.p.applyColor(colors.onSurfaceMuted),
        ),
        const SizedBox(height: 16),
        const BikeStatefulGrid(),
      ],
    );
  }
}

