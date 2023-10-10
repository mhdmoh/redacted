import 'package:flutter/material.dart';

abstract class RedactedConfiguration {
  final bool autoFillTexts;
  final String autoFillText;
  final Duration duration;

  const RedactedConfiguration({
    this.autoFillText =
        "This is a place holder text to fill the space for redaction",
    this.autoFillTexts = true,
    this.duration = const Duration(milliseconds: 1500),
  });
}

class GlowingRedactedConfiguration extends RedactedConfiguration {
  final Color glowingColor;

  const GlowingRedactedConfiguration({
    this.glowingColor = const Color(0xFFCDCDCD),
    super.duration,
    super.autoFillTexts,
    super.autoFillText,
  });
}

class ShimmerRedactedConfiguration extends RedactedConfiguration {
  final Color baseColor;
  final Color highlightColor;

  const ShimmerRedactedConfiguration({
    this.baseColor = const Color(0xFFCDCDCD),
    this.highlightColor = const Color.fromARGB(255, 165, 164, 164),
    super.duration,
    super.autoFillTexts,
    super.autoFillText,
  });
}
