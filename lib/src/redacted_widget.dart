// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:redacted/src/radacted_extensions.dart';
import 'package:redacted/src/redacted_configuration.dart';
import 'package:redacted/src/redacted_hide_widget.dart';
import 'package:redacted/src/unredacted_widget.dart';

extension Redacted on Widget {
  Widget redacted({
    required BuildContext context,
    required bool redact,
    RedactedConfiguration? configuration,
  }) {
    if (!redact) return this;
    if (this is RedactedHideWidget) {
      return Opacity(opacity: 0, child: (this as RedactedHideWidget).child);
    }
    if (this is UnredactedWidget) return (this as UnredactedWidget).child;

    if (this is Text) {
      return (this as Text).redact(configuration: configuration);
    }
    if (this is Column) {
      return (this as Column).redact(context, configuration: configuration);
    }
    if (this is Icon) {
      return (this as Icon).redact();
    }
    if (this is Row) {
      return (this as Row).redact(context, configuration: configuration);
    }
    if (this is Stack) {
      return (this as Stack).redact(context, configuration: configuration);
    }
    if (this is Align) {
      return (this as Align).redact(context, configuration: configuration);
    }
    if (this is Positioned) {
      return (this as Positioned).redact(context, configuration: configuration);
    }
    if (this is Wrap) {
      return (this as Wrap).redact(context, configuration: configuration);
    }
    if (this is Center) {
      return (this as Center).redact(context, configuration: configuration);
    }
    if (this is SizedBox) {
      return (this as SizedBox).redact(context, configuration: configuration);
    }
    if (this is Padding) {
      return (this as Padding).redact(context, configuration: configuration);
    }
    if (this is Expanded) {
      return (this as Expanded).redact(context, configuration: configuration);
    }
    if (this is AspectRatio) {
      return (this as AspectRatio)
          .redact(context, configuration: configuration);
    }
    if (this is Image) {
      return (this as Image).redact(configuration: configuration);
    }

    if (this is Container) {
      return (this as Container).redact(context, configuration: configuration);
    }
    if (this is InkWell) {
      return (this as InkWell).redact(context, configuration: configuration);
    }
    if (this is StatelessWidget) {
      return (this as StatelessWidget).build(context).redacted(
          context: context, redact: redact, configuration: configuration);
    }
    return this;
  }
}
