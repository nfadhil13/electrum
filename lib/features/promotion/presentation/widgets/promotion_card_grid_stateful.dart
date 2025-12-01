import 'package:electrum/core/localization/i18n/strings.g.dart';
import 'package:electrum/core/service_locator/service_locator.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/error/electrum_error_widget.dart';
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
        builder: (context, state) => switch (state) {
          PromotionListLoading() => const _PromotionCardGridShimmer(),
          PromotionListError() => ElectrumErrorWidget.fromException(
            state.exception,
            onRetry: () => context.read<PromotionListCubit>().loadPromotions(),
          ),
          PromotionListSuccess() =>
            state.promotions.isEmpty
                ? const _PromotionCardGridEmpty()
                : PromotionCarousel(promotions: state.promotions),
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

class _PromotionCardGridEmpty extends StatelessWidget {
  const _PromotionCardGridEmpty();

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
            Icons.local_offer_outlined,
            color: colors.onSurfaceMuted,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            t.noPromotionsAvailable,
            style: textStyles.p.applyColor(colors.onSurfaceMuted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
