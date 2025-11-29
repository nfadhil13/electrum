import 'package:flutter/material.dart';

part 'color.dart';
part 'text_style.dart';

class ElectrumStyleProvider extends StatefulWidget {
  final AppColors? colors;
  final AppTextStyles? textStyles;
  final Widget child;
  const ElectrumStyleProvider({
    super.key,
    this.colors,
    this.textStyles,
    required this.child,
  });

  static ElectrumStyle of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ElectrumStyle>()!;
  }

  @override
  State<ElectrumStyleProvider> createState() => _ElectrumStyleProviderState();
}

class _ElectrumStyleProviderState extends State<ElectrumStyleProvider> {
  late AppColors colors;
  late AppTextStyles textStyles;

  @override
  void initState() {
    super.initState();
    colors = widget.colors ?? AppColors.defaultColors;
    textStyles = widget.textStyles ?? AppTextStyles.defaultTextStyle;
  }

  @override
  Widget build(BuildContext context) {
    return ElectrumStyle(
      colors: colors,
      textStyles: textStyles,
      child: widget.child,
    );
  }
}

class ElectrumStyle extends InheritedWidget {
  final AppColors colors;
  final AppTextStyles textStyles;
  const ElectrumStyle({
    super.key,
    required this.colors,
    required this.textStyles,
    required super.child,
  });

  @override
  bool updateShouldNotify(ElectrumStyle oldWidget) {
    return false;
  }
}

extension ElectrumStyleExtension on BuildContext {
  AppColors get colors => ElectrumStyleProvider.of(this).colors;
  AppTextStyles get textStyles => ElectrumStyleProvider.of(this).textStyles;
}
