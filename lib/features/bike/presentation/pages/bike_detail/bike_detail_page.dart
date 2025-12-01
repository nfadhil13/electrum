import 'package:electrum/core/ext/color.dart';
import 'package:electrum/core/localization/i18n/strings.g.dart';
import 'package:electrum/core/service_locator/service_locator.dart';
import 'package:electrum/core/types/image_flutter.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/buttons/filled_button.dart';
import 'package:electrum/core/ui/widgets/error/electrum_error_widget.dart';
import 'package:electrum/core/ui/widgets/layout/loading_container.dart';
import 'package:electrum/core/ui/widgets/wrapper/bloc_provider_wrapper.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:electrum/features/bike/presentation/cubits/bike_detail/bike_detail_cubit.dart';
import 'package:electrum/features/bike/presentation/widgets/bike_availability_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

part 'widgets/bike_detail_content.dart';
part 'widgets/bike_detail_shimmer.dart';

class BikeDetailPage extends BlocProviderWrapper<BikeDetailCubit> {
  final String bikeId;

  const BikeDetailPage({super.key, required this.bikeId});

  @override
  BikeDetailCubit createBloc(BuildContext context) {
    final cubit = getIt<BikeDetailCubit>();
    cubit.loadBike(bikeId);
    return cubit;
  }

  @override
  Widget buildChild(BuildContext context, BikeDetailCubit bloc) {
    final colors = context.colors;

    return ElectrumLoadingContainer(
      initialValue: bloc.state.isLoading,
      isLoadingStream: bloc.stream.map((state) => state.isLoading),
      child: Scaffold(
        backgroundColor: colors.background,
        appBar: AppBar(
          backgroundColor: colors.surface,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: colors.onSurface),
            onPressed: () => context.pop(),
          ),
        ),
        body: BlocBuilder<BikeDetailCubit, BikeDetailState>(
          builder: (context, state) {
            if (state is BikeDetailLoading) {
              return const _BikeDetailShimmer();
            }

            if (state is BikeDetailError) {
              return ElectrumErrorWidget.fromException(
                state.exception,
                onRetry: () => bloc.loadBike(bikeId),
              );
            }

            if (state is BikeDetailSuccess) {
              return _BikeDetailContent(bike: state.bike);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
