import 'package:electrum/core/localization/i18n/strings.g.dart';
import 'package:electrum/core/router/router.dart';
import 'package:electrum/core/service_locator/service_locator.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/icons/app_icon.dart';
import 'package:electrum/features/auth/presentation/cubits/logout/logout_cubit.dart';
import 'package:electrum/features/bike/domain/entities/availability.dart';
import 'package:electrum/features/bike/presentation/widgets/card/bike_card_grid_stateful.dart';
import 'package:electrum/features/package/presentation/widgets/package_card_grid_stateful.dart';
import 'package:electrum/features/promotion/presentation/widgets/promotion_card_grid_stateful.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'widgets/appbar.dart';
part 'widgets/promotion_section.dart';
part 'widgets/rental_packages_section.dart';
part 'widgets/bikes_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final horizontalPadding = const EdgeInsets.symmetric(horizontal: 20);
    return Scaffold(
      backgroundColor: colors.background,
      appBar: const _HomeAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promotion Section
              const _PromotionSection(),
              const SizedBox(height: 32),
              // Rental Packages Section
              Padding(
                padding: horizontalPadding,
                child: const _RentalPackagesSection(),
              ),
              const SizedBox(height: 32),
              // Bikes Section
              Padding(padding: horizontalPadding, child: const _BikesSection()),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
