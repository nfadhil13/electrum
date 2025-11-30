import 'package:electrum/core/router/router.dart';
import 'package:electrum/core/service_locator/service_locator.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/icons/app_icon.dart';
import 'package:electrum/features/auth/presentation/cubits/logout/logout_cubit.dart';
import 'package:electrum/features/bike/presentation/widgets/bike_card_grid_stateful.dart';
import 'package:electrum/features/package/presentation/widgets/package_card_grid_stateful.dart';
import 'package:electrum/features/promotion/presentation/widgets/promotion_card_grid_stateful.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.background,
      appBar: const _HomeAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Explore & Rent Section
              const _ExploreRentSection(),
              const SizedBox(height: 32),
              // Promotion Section
              const _PromotionSection(),
              const SizedBox(height: 32),
              // Rental Packages Section
              const _RentalPackagesSection(),
              const SizedBox(height: 32),
              // Bikes Section
              const _BikesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExploreRentSection extends StatelessWidget {
  const _ExploreRentSection();

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Explore & Rent',
          style: textStyles.h2.bold.applyColor(colors.onSurface),
        ),
        const SizedBox(height: 8),
        Text(
          'Find the perfect electric bike for your journey.',
          style: textStyles.p.applyColor(colors.onSurfaceMuted),
        ),
      ],
    );
  }
}

class _PromotionSection extends StatelessWidget {
  const _PromotionSection();

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Active Promotions',
          style: textStyles.h3.bold.applyColor(colors.onSurface),
        ),
        const SizedBox(height: 8),
        Text(
          'Special offers and deals for you.',
          style: textStyles.p.applyColor(colors.onSurfaceMuted),
        ),
        const SizedBox(height: 16),
        const PromotionStatefulCarousel(),
      ],
    );
  }
}

class _RentalPackagesSection extends StatelessWidget {
  const _RentalPackagesSection();

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rental Packages',
          style: textStyles.h3.bold.applyColor(colors.onSurface),
        ),
        const SizedBox(height: 8),
        Text(
          'Choose the plan that fits your lifestyle.',
          style: textStyles.p.applyColor(colors.onSurfaceMuted),
        ),
        const SizedBox(height: 16),
        const PackageStatefulGrid(),
      ],
    );
  }
}

class _BikesSection extends StatelessWidget {
  const _BikesSection();

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Electrum Bikes',
          style: textStyles.h3.bold.applyColor(colors.onSurface),
        ),
        const SizedBox(height: 8),
        Text(
          'Discover our fleet of premium electric bikes.',
          style: textStyles.p.applyColor(colors.onSurfaceMuted),
        ),
        const SizedBox(height: 16),
        const BikeStatefulGrid(),
      ],
    );
  }
}
