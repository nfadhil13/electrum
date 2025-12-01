import 'package:electrum/core/ext/color.dart';
import 'package:electrum/core/localization/i18n/strings.g.dart';
import 'package:electrum/core/service_locator/service_locator.dart';
import 'package:electrum/core/ui/messenger/messenger.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/buttons/filled_button.dart';
import 'package:electrum/core/ui/widgets/buttons/outline_button.dart';
import 'package:electrum/core/ui/widgets/error/electrum_error_widget.dart';
import 'package:electrum/core/ui/widgets/form/form.dart';
import 'package:electrum/core/ui/widgets/form/date_picker_field.dart';
import 'package:electrum/core/ui/widgets/form/textfield/dropdown_field.dart';
import 'package:electrum/core/ui/widgets/form/textfield/textfield.dart';
import 'package:electrum/core/ui/widgets/layout/loading_container.dart';
import 'package:electrum/features/bike/domain/entities/bike.dart';
import 'package:electrum/features/bike/domain/entities/bike_interest_form.dart';
import 'package:electrum/features/bike/presentation/cubits/bike_interest_form/bike_interest_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BikeInterestFormPage extends StatelessWidget {
  final String bikeId;

  const BikeInterestFormPage({super.key, required this.bikeId});

  static Future<bool> show(BuildContext context, String bikeId) async {
    final result = await showDialog(
      context: context,

      builder: (context) => BikeInterestFormPage(bikeId: bikeId),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BikeInterestFormCubit>(
      create: (context) => getIt<BikeInterestFormCubit>()..loadBike(bikeId),
      child: _BikeInterestFormContent(bikeId: bikeId),
    );
  }
}

class _BikeInterestFormContent extends StatelessWidget {
  final String bikeId;

  const _BikeInterestFormContent({required this.bikeId});

  @override
  Widget build(BuildContext context) {
    final bikeInterestFormCubit = context.read<BikeInterestFormCubit>();

    return ElectrumLoadingContainer(
      initialValue: bikeInterestFormCubit.state.isLoading,
      isLoadingStream: bikeInterestFormCubit.stream.map(
        (state) => state.isLoading,
      ),
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 12),
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(24),
          child: BlocBuilder<BikeInterestFormCubit, BikeInterestFormState>(
            builder: (context, state) => switch (state) {
              BikeInterestFormPreparingSuccess() => _BikeForm(bike: state.bike),
              BikeInterestFormPreparingError() =>
                ElectrumErrorWidget.fromException(state.exception),
              BikeInterestFormPreparing() => const SizedBox.shrink(),
            },
          ),
        ),
      ),
    );
  }
}

class _BikeForm extends StatelessWidget {
  final BikeEntity bike;
  const _BikeForm({required this.bike});

  static const _pickupAreas = [
    ElectrumDropdownItem<String>(value: 'Jakarta', label: 'Jakarta'),
    ElectrumDropdownItem<String>(value: 'Bandung', label: 'Bandung'),
    ElectrumDropdownItem<String>(value: 'Surabaya', label: 'Surabaya'),
    ElectrumDropdownItem<String>(value: 'Yogyakarta', label: 'Yogyakarta'),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bikeInterestFormCubit = context.read<BikeInterestFormCubit>();
    final textStyles = context.textStyles;
    final t = Translations.of(context);
    return ElectrumForm(
      initialData: BikeInterestFormEntity(bikeId: bike.id),
      onSubmit: (submitResult) {
        bikeInterestFormCubit.submitInterest(submitResult.value);
      },
      child: Builder(
        builder: (context) {
          final form = context.electrumForm<BikeInterestFormEntity>();
          return BlocListener<BikeInterestFormCubit, BikeInterestFormState>(
            listener: (context, state) {
              if (state is BikeInterestFormSuccess) {
                Navigator.of(context).pop(true);
                context.showSuccessSnackbar(t.interestSubmittedSuccessfully);
              }
              if (state is BikeInterestFormError) {
                form.setError(state.errors);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.rentalInterestForm,
                            style: textStyles.h2.bold.applyColor(
                              colors.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            bike.name,
                            style: textStyles.p.applyColor(
                              colors.onSurfaceMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: colors.onSurfaceVariant),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Preferred Start Date
                ElectrumDatePickerField(
                  label: '${t.preferredStartDate} *',
                  hint: t.preferredStartDatePlaceholder,
                  initialValue: form.value.preferredStartDate,
                  onChanged: (date) {
                    form.value.preferredStartDate = date;
                  },
                  onSaved: (value) {
                    form.value.preferredStartDate = value;
                  },
                  validator: (value) {
                    return form.errors('preferredStartDate');
                  },
                ),
                const SizedBox(height: 16),
                // Pickup Area
                ElectrumDropdownField<String>(
                  label: '${t.pickupArea} *',
                  hint: t.pickupAreaPlaceholder,
                  value: form.value.pickUpArea,
                  items: _pickupAreas,
                  onChanged: (value) {
                    form.value.pickUpArea = value;
                  },
                  onSaved: (value) {
                    form.value.pickUpArea = value;
                  },
                  validator: (value) => form.errors('pickUpArea'),
                ),
                const SizedBox(height: 16),
                // Contact
                ElectrumTextField(
                  label: '${t.contact} *',
                  hint: t.contactPlaceholder,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    form.value.contact = value ?? '';
                  },
                  validator: (value) => form.errors('contact'),
                ),
                const SizedBox(height: 16),
                // Additional Notes
                ElectrumTextField(
                  label: t.additionalNotes,
                  hint: t.additionalNotesPlaceholder,
                  maxLines: 4,
                  onSaved: (value) {
                    form.value.additionalNotes = value;
                  },
                  validator: (value) => form.errors('additionalNotes'),
                ),
                BlocBuilder<BikeInterestFormCubit, BikeInterestFormState>(
                  builder: (context, state) {
                    if (state is! BikeInterestFormError) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.error, width: 1),
                          color: colors.error.applyOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          state.exception.message,
                          style: textStyles.p.applyColor(colors.error),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                // Buttons
                BlocBuilder<BikeInterestFormCubit, BikeInterestFormState>(
                  builder: (context, state) {
                    final isSubmitting = state.isLoading;
                    return Row(
                      children: [
                        Expanded(
                          child: ElectrumOutlineButton(
                            text: t.cancel,
                            onPressed: isSubmitting
                                ? null
                                : () => Navigator.of(context).pop(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElectrumFilledButton(
                            text: t.submitRequest,
                            onPressed: isSubmitting
                                ? null
                                : () => form.submit(),
                            enabled: !isSubmitting,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
