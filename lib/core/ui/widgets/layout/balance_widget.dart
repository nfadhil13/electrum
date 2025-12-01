import 'package:flutter/material.dart';

class LeftSameHeightWidget extends StatelessWidget {
  final Widget right;
  final Widget Function(BuildContext context, double height) left;
  final double leftWidth;
  final double spacing;
  const LeftSameHeightWidget({
    super.key,
    required this.left,
    required this.right,
    required this.leftWidth,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          spacing: spacing,
          children: [
            SizedBox(width: leftWidth),
            Expanded(child: right),
          ],
        ),
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.centerLeft,
                child: left(context, constraints.maxHeight),
              );
            },
          ),
        ),
      ],
    );
  }
}
