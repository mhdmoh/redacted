import 'package:redacted/src/redacyed_style.dart';

class RedactedConfiguration {
  bool autoFillTexts;
  String autoFillText;
  RedactedStyle style = ShimmerStyle();

  RedactedConfiguration({
    this.autoFillText =
        "This is a place holder text to fill the space for redaction",
    this.autoFillTexts = true,
    required this.style,
  });
}
