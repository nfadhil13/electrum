import 'package:electrum/core/ui/responsive/responsive.dart';
import 'package:electrum/features/package/domain/entities/package.dart';
import 'package:electrum/features/package/presentation/widgets/package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PackageCardGrid extends StatelessWidget {
  final List<Package> packages;
  final VoidCallback? Function(Package)? onPackageTap;

  const PackageCardGrid({super.key, required this.packages, this.onPackageTap});

  @override
  Widget build(BuildContext context) {
    return BreakPointWidget(
      xs: _buildGrid(context, crossAxisCount: 1),
      sm: _buildGrid(context, crossAxisCount: 2),
      md: _buildGrid(context, crossAxisCount: 3),
    );
  }

  Widget _buildGrid(BuildContext context, {required int crossAxisCount}) {
    if (crossAxisCount == 1) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final package = packages[index];
          return PackageCard(
            package: package,
            onTap: onPackageTap != null ? () => onPackageTap!(package) : null,
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
      itemCount: packages.length,
      itemBuilder: (context, index) {
        final package = packages[index];
        return PackageCard(
          package: package,
          isMostPopular: index == 1,
          onTap: onPackageTap != null ? () => onPackageTap!(package) : null,
        );
      },
    );
  }
}
