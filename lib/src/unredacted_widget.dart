import 'package:flutter/material.dart';

class UnredactedWidget extends StatelessWidget {
  const UnredactedWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

extension Unredacted on Widget {
  Widget get unredacted => UnredactedWidget(child: this);
}
