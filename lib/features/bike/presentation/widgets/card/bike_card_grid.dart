import 'package:electrum/core/ui/responsive/responsive.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:electrum/features/bike/presentation/widgets/card/bike_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BikeCardGrid extends StatelessWidget {
  final List<Bike> bikes;
  final void Function(Bike)? onBikeTap;

  const BikeCardGrid({super.key, required this.bikes, this.onBikeTap});

  @override
  Widget build(BuildContext context) {
    return BreakPointWidget(
      xs: _buildGrid(context, crossAxisCount: 2),
      md: _buildGrid(context, crossAxisCount: 3),
    );
  }

  Widget _buildGrid(BuildContext context, {required int crossAxisCount}) {
    if (crossAxisCount == 1) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: bikes.length,
        itemBuilder: (context, index) {
          final bike = bikes[index];
          return BikeCard(
            bike: bike,
            onTap: onBikeTap != null ? () => onBikeTap!(bike) : null,
          );
        },
      );
    }
    return AlignedGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemCount: bikes.length,
      itemBuilder: (context, index) {
        final bike = bikes[index];
        return BikeCard(
          bike: bike,
          onTap: onBikeTap != null ? () => onBikeTap!(bike) : null,
        );
      },
    );
  }
}
