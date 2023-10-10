import 'package:flutter/material.dart';

abstract class RedactedConfiguration {
  final bool autoFillTexts = true;
  final String autoFillText =
      "This is a place holder text to fill the space for redaction";

  const RedactedConfiguration();
}

class GlowingRedactedConfiguration extends RedactedConfiguration {
  final Color glowingColor;
  final Duration animationDuration;

  const GlowingRedactedConfiguration({
    this.glowingColor = const Color(0xFFCDCDCD),
    this.animationDuration = const Duration(milliseconds: 1500),
  });
}

class ShimmerRedactedConfiguration extends RedactedConfiguration {
  final Color baseColor;
  final Color highlightColor;
  final Duration animationDuration;

  const ShimmerRedactedConfiguration({
    this.baseColor = const Color(0xFFCDCDCD),
    this.highlightColor = const Color.fromARGB(255, 165, 164, 164),
    this.animationDuration = const Duration(milliseconds: 1500),
  });
}
