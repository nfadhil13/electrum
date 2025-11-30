import 'package:electrum/core/service_locator/service_locator.dart';
import 'package:electrum/core/ui/responsive/responsive.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/buttons/filled_button.dart';
import 'package:electrum/features/promotion/presentation/cubits/promotion_list/promotion_list_cubit.dart';
import 'package:electrum/features/promotion/presentation/widgets/promotion_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class PromotionStatefulCarousel extends StatelessWidget {
  final double? height;
  const PromotionStatefulCarousel({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PromotionListCubit>()..loadPromotions(),
      child: BlocBuilder<PromotionListCubit, PromotionListState>(
        builder: (context, state) {
          if (state is PromotionListLoading) {
            return const _PromotionCardGridShimmer();
          }

          if (state is PromotionListError) {
            return _PromotionCardGridError(
              error: state.exception.message,
              onRetry: () =>
                  context.read<PromotionListCubit>().loadPromotions(),
            );
          }

          if (state is PromotionListSuccess) {
            if (state.promotions.isEmpty) {
              return const _PromotionCardGridEmpty();
            }
            return PromotionCarousel(
              promotions: state.promotions,
              height: height,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _PromotionCardGridShimmer extends StatelessWidget {
  const _PromotionCardGridShimmer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => const _ShimmerCard(),
      ),
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
        width: MediaQuery.of(context).size.width - 48,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: colors.surfaceVariant,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

class _PromotionCardGridError extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _PromotionCardGridError({required this.error, required this.onRetry});

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

class _PromotionCardGridEmpty extends StatelessWidget {
  const _PromotionCardGridEmpty();

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
            Icons.local_offer_outlined,
            color: colors.onSurfaceMuted,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            'No promotions available',
            style: textStyles.p.applyColor(colors.onSurfaceMuted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
