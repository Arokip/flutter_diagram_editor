import 'package:flutter/material.dart';

/// Immutable configuration for the diagram canvas.
class CanvasConfig {
  const CanvasConfig({
    this.initialScale = 1,
    this.initialPosition = Offset.zero,
    this.minScale = 0.1,
    this.maxScale = 8,
    this.mouseScrollSpeed = 0.8,
    this.backgroundColor = Colors.white,
    this.enablePan = true,
    this.enableZoom = true,
  })  : assert(minScale > 0, 'minScale must be positive'),
        assert(maxScale > minScale, 'maxScale must be greater than minScale'),
        assert(
          initialScale >= minScale && initialScale <= maxScale,
          'initialScale must be between minScale and maxScale',
        ),
        assert(
          mouseScrollSpeed > 0 && mouseScrollSpeed < 1,
          'mouseScrollSpeed must be between 0 and 1 (exclusive)',
        );

  /// Initial canvas scale. Defaults to 1.0.
  final double initialScale;

  /// Initial canvas position. Defaults to [Offset.zero].
  final Offset initialPosition;

  /// Minimum allowed scale. Defaults to 0.1.
  final double minScale;

  /// Maximum allowed scale. Defaults to 8.0.
  final double maxScale;

  /// Speed of mouse wheel zoom. Defaults to 0.8.
  final double mouseScrollSpeed;

  /// Canvas background color. Defaults to [Colors.white].
  final Color backgroundColor;

  /// Whether panning is enabled. Defaults to true.
  final bool enablePan;

  /// Whether zooming is enabled. Defaults to true.
  final bool enableZoom;
}
