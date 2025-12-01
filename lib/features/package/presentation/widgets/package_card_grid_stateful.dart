import 'package:electrum/core/localization/i18n/strings.g.dart';
import 'package:electrum/core/service_locator/service_locator.dart';
import 'package:electrum/core/ui/responsive/responsive.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/error/electrum_error_widget.dart';
import 'package:electrum/features/package/presentation/cubits/package_list/package_list_cubit.dart';
import 'package:electrum/features/package/presentation/widgets/package_card_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class PackageStatefulGrid extends StatelessWidget {
  const PackageStatefulGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PackageListCubit>()..loadPackages(),
      child: BlocBuilder<PackageListCubit, PackageListState>(
        builder: (context, state) {
          if (state is PackageListLoading) {
            return const _PackageCardGridShimmer();
          }

          if (state is PackageListError) {
            return ElectrumErrorWidget.fromException(
              state.exception,
              onRetry: () => context.read<PackageListCubit>().loadPackages(),
            );
          }

          if (state is PackageListSuccess) {
            if (state.packages.isEmpty) {
              return const _PackageCardGridEmpty();
            }
            return PackageCardGrid(packages: state.packages);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _PackageCardGridShimmer extends StatelessWidget {
  const _PackageCardGridShimmer();

  @override
  Widget build(BuildContext context) {
    return BreakPointWidget(
      xs: _buildShimmerGrid(crossAxisCount: 1),
      sm: _buildShimmerGrid(crossAxisCount: 2),
      md: _buildShimmerGrid(crossAxisCount: 3),
    );
  }

  Widget _buildShimmerGrid({required int crossAxisCount}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: 3,
      itemBuilder: (context, index) => const _ShimmerCard(),
    );
  }
}

class _ShimmerCard extends StatelessWidget {
  const _ShimmerCard();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Shimmer.fromColors(
      baseColor: colors.surfaceVariant,
      highlightColor: colors.surface,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colors.surfaceVariant,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.outline, width: 1),
        ),
      ),
    );
  }
}

class _PackageCardGridEmpty extends StatelessWidget {
  const _PackageCardGridEmpty();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final t = context.t;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outline, width: 1),
      ),
      child: Column(
        children: [
          Icon(
            Icons.card_giftcard_outlined,
            color: colors.onSurfaceMuted,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            t.noPackagesAvailable,
            style: textStyles.p.applyColor(colors.onSurfaceMuted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
