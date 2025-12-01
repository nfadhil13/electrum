import 'package:electrum/core/localization/i18n/strings.g.dart';
import 'package:electrum/core/router/router.dart';
import 'package:electrum/core/service_locator/service_locator.dart';
import 'package:electrum/core/ui/responsive/responsive.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/error/electrum_error_widget.dart';
import 'package:electrum/features/bike/domain/entities/availability.dart';
import 'package:electrum/features/bike/presentation/cubits/bike_list/bike_list_cubit.dart';
import 'package:electrum/features/bike/presentation/widgets/card/bike_card_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class BikeStatefulGrid extends StatefulWidget {
  final Availability? filter;

  const BikeStatefulGrid({super.key, this.filter});

  @override
  State<BikeStatefulGrid> createState() => _BikeStatefulGridState();
}

class _BikeStatefulGridState extends State<BikeStatefulGrid> {
  late final BikeListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<BikeListCubit>();
    _cubit.loadBikes(availability: widget.filter);
  }

  @override
  void didUpdateWidget(BikeStatefulGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.filter != widget.filter) {
      _cubit.loadBikes(availability: widget.filter);
    }
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: const _BikeStatefulGridContent(),
    );
  }
}

class _BikeStatefulGridContent extends StatelessWidget {
  const _BikeStatefulGridContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BikeListCubit, BikeListState>(
      builder: (context, state) {
        print(state);
        return switch (state) {
          BikeListLoading() => const _BikeCardGridShimmer(),
          BikeListError() => ElectrumErrorWidget.fromException(
            state.exception,
            onRetry: () => state.onRetry(),
          ),
          BikeListSuccess() =>
            state.bikes.isEmpty
                ? const _BikeCardGridEmpty()
                : BikeCardGrid(
                    bikes: state.bikes,
                    onBikeTap: (bike) => context.push(
                      AppRoutes.bikeDetails.withParameter('id', bike.id),
                    ),
                  ),
        };
      },
    );
  }
}

class _BikeCardGridShimmer extends StatelessWidget {
  const _BikeCardGridShimmer();

  @override
  Widget build(BuildContext context) {
    return BreakPointWidget(
      xs: _buildShimmerGrid(crossAxisCount: 2),
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
        child: const SizedBox.shrink(),
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
            Icons.pedal_bike_outlined,
            color: colors.onSurfaceMuted,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            t.noBikesAvailable,
            style: textStyles.p.applyColor(colors.onSurfaceMuted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
