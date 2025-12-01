part of '../bike_detail_page.dart';

class BikeInterestDialog extends StatelessWidget {
  final BikeDetailEntity bike;
  final BikeInterestEntity interest;

  const BikeInterestDialog({
    super.key,
    required this.bike,
    required this.interest,
  });

  static Future<void> show(
    BuildContext context,
    BikeDetailEntity bike, {
    required BikeInterestEntity interest,
  }) {
    return showDialog(
      context: context,
      builder: (context) => BikeInterestDialog(bike: bike, interest: interest),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final t = context.t;
    final dateText = DateFormat(
      'dd/MM/yyyy',
    ).format(interest.preferedStartDate);

    return Dialog(
      backgroundColor: colors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.rentalInterestForm,
                        style: textStyles.h2.bold.applyColor(colors.onSurface),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        bike.name,
                        style: textStyles.p.applyColor(colors.onSurfaceMuted),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: colors.onSurfaceVariant),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _InterestDialogField(label: t.preferredStartDate, value: dateText),
            _InterestDialogField(
              label: t.pickupArea,
              value: interest.pickUpArea,
            ),
            _InterestDialogField(label: t.contact, value: interest.contact),
          ],
        ),
      ),
    );
  }
}

class _InterestDialogField extends StatelessWidget {
  final String label;
  final String value;

  const _InterestDialogField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: textStyles.label.applyColor(colors.onSurface)),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: colors.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colors.outline, width: 1),
            ),
            child: Text(
              value,
              style: textStyles.p.applyColor(colors.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
