part of '../bike_detail_page.dart';

class _BikeDetailContent extends StatelessWidget {
  final BikeDetailEntity bike;

  const _BikeDetailContent({required this.bike});

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 0.4;
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BreakPointWidget(
            xs: Column(
              children: [
                _BikeImageSection(bike: bike),
                _BikeDetailsSection(bike: bike),
              ],
            ),
            md: Column(
              children: [
                LeftSameHeightWidget(
                  leftWidth: imageWidth,
                  left: (context, height) => _BikeImageSection(
                    bike: bike,
                    imageSize: Size(imageWidth, height),
                  ),
                  right: _BikeDetailsSection(bike: bike),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BikeImageSection extends StatelessWidget {
  final BikeDetailEntity bike;
  final Size? imageSize;

  const _BikeImageSection({required this.bike, this.imageSize});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final image = Image(
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
    );

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: imageSize != null
              ? SizedBox(
                  width: imageSize!.width,
                  height: imageSize!.height,
                  child: image,
                )
              : AspectRatio(aspectRatio: 4 / 3, child: image),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: BikeAvailabilityBadge(availability: bike.availability),
        ),
      ],
    );
  }
}

class _BikeDetailsSection extends StatelessWidget {
  final BikeDetailEntity bike;

  const _BikeDetailsSection({required this.bike});

  List<_SpecificationCardData> _specificationCardData(BuildContext context) => [
    _SpecificationCardData(
      icon: Icons.battery_charging_full,
      label: t.range,
      value: '${bike.rangeInKm.toStringAsFixed(0)} km',
      color: Colors.red,
    ),
    _SpecificationCardData(
      icon: Icons.speed,
      label: t.topSpeed,
      value: '${bike.topSpeedInKmH.toStringAsFixed(0)} km/h',
      color: Colors.purple,
    ),
    _SpecificationCardData(
      icon: Icons.access_time,
      label: t.chargingTime,
      value: '${bike.chargingTimeInHours.toStringAsFixed(0)} hours',
      color: Colors.green,
    ),
    _SpecificationCardData(
      icon: Icons.scale,
      label: t.weight,
      value: '${bike.weightInKg.toStringAsFixed(0)} kg',
      color: Colors.orange,
    ),
  ];

  void _onInterestedToRent(BuildContext context) async {
    final bloc = context.read<BikeDetailCubit>();
    final result = await BikeInterestFormPage.show(context, bike.id);
    if (!result) return;
    bloc.refreshBike();
  }

  void _onViewDetails(BuildContext context, BikeInterestEntity interest) {
    BikeInterestDialog.show(context, bike, interest: interest);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final t = context.t;
    final specificationCardData = _specificationCardData(context);
    final interest = bike.interest;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bike Name
        Text(bike.name, style: textStyles.h1.bold.applyColor(colors.onSurface)),
        const SizedBox(height: 16),
        // Description
        Text(
          bike.description,
          style: textStyles.p.applyColor(colors.onSurfaceMuted),
        ),
        const SizedBox(height: 32),
        // Specifications Grid
        AlignedGridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemBuilder: (context, index) =>
              _SpecificationCard.fromData(specificationCardData[index]),
          itemCount: specificationCardData.length,
        ),
        const SizedBox(height: 24),
        // Motor Power
        Row(
          children: [
            Icon(Icons.bolt, size: 20, color: colors.primary),
            const SizedBox(width: 8),
            Text(
              '${t.motorPower}: ${(bike.motorPowerInKw * 1000).toStringAsFixed(0)}W',
              style: textStyles.p.applyColor(colors.onSurface),
            ),
          ],
        ),
        const SizedBox(height: 32),
        if (interest == null)
          ElectrumFilledButton(
            text: t.interestedToRent,
            width: double.infinity,
            onPressed: () => _onInterestedToRent(context),
          )
        else
          // View existing interest
          ElectrumFilledButton(
            text: t.viewDetails,
            width: double.infinity,
            onPressed: () => _onViewDetails(context, interest),
          ),
      ],
    );
  }
}

class _SpecificationCardData {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _SpecificationCardData({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
}

class _SpecificationCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  _SpecificationCard.fromData(_SpecificationCardData item)
    : this(
        icon: item.icon,
        label: item.label,
        value: item.value,
        color: item.color,
      );

  const _SpecificationCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.applyOpacity(.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 24, color: color),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: textStyles.p
                    .applyColor(colors.onSurfaceMuted)
                    .copyWith(fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: textStyles.h4.bold.applyColor(colors.onSurface),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
