import 'package:flutter/material.dart';

abstract class RedactedStyle {}

class StaticColorStyle extends RedactedStyle {
  final Color color;

  StaticColorStyle({
    this.color = Colors.grey,
  });
}

class ShimmerStyle extends RedactedStyle {
  final Color baseColor;
  final Color highlightColor;

  ShimmerStyle({
    this.baseColor = Colors.grey,
    this.highlightColor = Colors.white,
  });
}

class GlowStyle extends RedactedStyle {
  Color color;
  Duration duration;
  bool inheritColor;

  GlowStyle({
    this.color = Colors.grey,
    this.duration = const Duration(milliseconds: 800),
    this.inheritColor = false,
  });
}
