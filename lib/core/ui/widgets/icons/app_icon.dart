import 'package:electrum/core/ui/styles/style.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double size;
  const AppIcon({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      decoration: BoxDecoration(
        color: context.colors.primary,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.person, size: size),
    );
  }
}
