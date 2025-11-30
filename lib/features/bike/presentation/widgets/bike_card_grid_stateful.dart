import 'package:electrum/core/service_locator/service_locator.dart';
import 'package:electrum/core/ui/responsive/responsive.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/buttons/filled_button.dart';
import 'package:electrum/features/bike/presentation/cubits/bike_list/bike_list_cubit.dart';
import 'package:electrum/features/bike/presentation/widgets/bike_card_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class BikeStatefulGrid extends StatelessWidget {
  const BikeStatefulGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BikeListCubit>()..loadBikes(),
      child: BlocBuilder<BikeListCubit, BikeListState>(
        builder: (context, state) {
          if (state is BikeListLoading) {
            return const _BikeCardGridShimmer();
          }

          if (state is BikeListError) {
            return _BikeCardGridError(
              error: state.exception.message,
              onRetry: () => context.read<BikeListCubit>().loadBikes(),
            );
          }

          if (state is BikeListSuccess) {
            if (state.bikes.isEmpty) {
              return const _BikeCardGridEmpty();
            }
            return BikeCardGrid(bikes: state.bikes);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _BikeCardGridShimmer extends StatelessWidget {
  const _BikeCardGridShimmer();

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
        childAspectRatio: 0.8,
      ),
      itemCount: 6,
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
        decoration: BoxDecoration(
          color: colors.surfaceVariant,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.outline, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: colors.onSurfaceVariant,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colors.onSurfaceVariant,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 14,
                    width: 120,
                    decoration: BoxDecoration(
                      color: colors.onSurfaceVariant,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 14,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colors.onSurfaceVariant,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 14,
                    width: 150,
                    decoration: BoxDecoration(
                      color: colors.onSurfaceVariant,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colors.onSurfaceVariant,
                      borderRadius: BorderRadius.circular(8),
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

class _BikeCardGridError extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _BikeCardGridError({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.error, width: 1),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: colors.error, size: 48),
          const SizedBox(height: 16),
          Text(
            error,
            style: textStyles.p.applyColor(colors.onSurface),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElectrumFilledButton(text: 'Retry', onPressed: onRetry),
        ],
      ),
    );
  }
}

class _BikeCardGridEmpty extends StatelessWidget {
  const _BikeCardGridEmpty();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

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
            Icons.pedal_bike_outlined,
            color: colors.onSurfaceMuted,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            'No bikes available',
            style: textStyles.p.applyColor(colors.onSurfaceMuted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
