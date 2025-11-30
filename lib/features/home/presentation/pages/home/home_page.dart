import 'package:electrum/core/router/router.dart';
import 'package:electrum/core/service_locator/service_locator.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/icons/app_icon.dart';
import 'package:electrum/features/auth/presentation/cubits/logout/logout_cubit.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promotion Section
              _PromotionSection(),
              const SizedBox(height: 32),
              // Rental Packages Section (placeholder)
              // const _RentalPackagesSection(),
              // const SizedBox(height: 32),
              // Bikes Section (placeholder)
              // const _BikesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PromotionSection extends StatelessWidget {
  const _PromotionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [const PromotionStatefulCarousel()],
    );
  }
}
