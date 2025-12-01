import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/core/ui/widgets/form/field_decoration.dart';
import 'package:electrum/core/ui/widgets/form/form_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ElectrumDatePickerField extends StatefulWidget {
  final DateTime? value;
  final String? label;
  final String? hint;
  final IconData? icon;
  final ValueChanged<DateTime>? onChanged;
  final bool enabled;
  final FormFieldSaved<DateTime>? onSaved;
  final FormFieldValidator<DateTime?>? validator;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;

  const ElectrumDatePickerField({
    super.key,
    this.value,
    this.label,
    this.hint,
    this.icon,
    this.onChanged,
    this.enabled = true,
    this.onSaved,
    this.validator,
    this.firstDate,
    this.lastDate,
    this.initialDate,
  });

  @override
  State<ElectrumDatePickerField> createState() =>
      _ElectrumDatePickerFieldState();
}

class _ElectrumDatePickerFieldState extends State<ElectrumDatePickerField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _updateController();
  }

  @override
  void didUpdateWidget(ElectrumDatePickerField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _updateController();
    }
  }

  void _updateController() {
    final dateFormat = DateFormat('dd/MM/yyyy');
    _controller.text = widget.value != null
        ? dateFormat.format(widget.value!)
        : '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _showDatePicker(BuildContext context) async {
    if (!widget.enabled) return;

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.value ?? widget.initialDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime.now(),
      lastDate:
          widget.lastDate ?? DateTime.now().add(const Duration(days: 365 * 2)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: context.colors.primary,
              onPrimary: context.colors.onPrimary,
              surface: context.colors.surface,
              onSurface: context.colors.onSurface,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && widget.onChanged != null) {
      widget.onChanged!(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;

    return ElectrumFormWrapper(
      label: widget.label,
      child: AbsorbPointer(
        child: InkWell(
          onTap: () => _showDatePicker(context),
          child: TextFormField(
            enabled: false,
            controller: _controller,
            validator: widget.validator != null
                ? (value) => widget.validator!(widget.value)
                : null,
            onSaved: widget.onSaved != null
                ? (value) => widget.onSaved!(widget.value)
                : null,
            style: textStyles.input.applyColor(colors.onSurface),
            decoration: ElectrumFieldDecoration.build(
              context: context,
              hint: widget.hint,
              prefixIcon: widget.icon,
              suffixIcon: Icon(
                Icons.calendar_today,
                color: colors.onSurfaceVariant,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
