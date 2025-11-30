import 'dart:async';

import 'package:electrum/core/ext/color.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:flutter/material.dart';

class ElectrumLoadingContainer extends StatefulWidget {
  final Widget child;
  final Stream<bool> isLoadingStream;
  final bool initialValue;
  final Color? backgroundColor;
  final Color? indicatorColor;

  const ElectrumLoadingContainer({
    super.key,
    required this.child,
    required this.isLoadingStream,
    this.initialValue = false,
    this.backgroundColor,
    this.indicatorColor,
  });

  @override
  State<ElectrumLoadingContainer> createState() =>
      _ElectrumLoadingContainerState();
}

class _ElectrumLoadingContainerState extends State<ElectrumLoadingContainer> {
  OverlayEntry? _overlayEntry;
  StreamSubscription<bool>? _subscription;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _showOverlay();
        }
      });
    }
    _subscribe();
  }

  @override
  void didUpdateWidget(ElectrumLoadingContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLoadingStream != widget.isLoadingStream) {
      _unsubscribe();
      _subscribe();
    }
  }

  void _subscribe() {
    _subscription = widget.isLoadingStream.listen((isLoading) {
      if (mounted) {
        if (isLoading) {
          _showOverlay();
        } else {
          _hideOverlay();
        }
      }
    });
  }

  void _unsubscribe() {
    _subscription?.cancel();
    _subscription = null;
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => _buildLoadingOverlay(context),
    );

    Overlay.of(context, debugRequiredFor: widget).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
  }

  Widget _buildLoadingOverlay(BuildContext context) {
    final colors = context.colors;

    return Material(
      color: widget.backgroundColor ?? colors.background.applyOpacity(0.7),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.indicatorColor ?? colors.primary,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _unsubscribe();
    _hideOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
