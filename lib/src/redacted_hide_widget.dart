import 'package:flutter/material.dart';

class RedactedHideWidget extends StatelessWidget {
  const RedactedHideWidget({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return child;
  }
}

extension HideRedacted on Widget {
  Widget get hide => RedactedHideWidget(child: this);
}
