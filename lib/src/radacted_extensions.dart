import 'package:flutter/material.dart';
import 'package:measure_size/measure_size.dart';
import 'package:redacted/src/redacted_configuration.dart';
import 'package:redacted/src/redacted_widget.dart';
import 'package:redacted/src/redacyed_style.dart';
import 'package:shimmer/shimmer.dart';

extension RedactedText on Text {
  Widget redact({RedactedConfiguration? configuration}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var text = data ?? "";
        if (text.isEmpty) {
          if ((configuration ?? RedactedConfiguration(style: ShimmerStyle()))
              .autoFillTexts) {
            text =
                (configuration ?? RedactedConfiguration(style: ShimmerStyle()))
                    .autoFillText;
          } else {
            return const SizedBox.shrink();
          }
        }

        final span = TextSpan(text: text, style: style);
        final tp = TextPainter(
            text: span, textDirection: textDirection ?? TextDirection.ltr);
        tp.layout(maxWidth: constraints.maxWidth);

        TextSelection selection =
            TextSelection(baseOffset: 0, extentOffset: text.length);
        List<TextBox> boxes = tp.getBoxesForSelection(selection);

        List<Widget> children = [];

        for (var box in boxes) {
          children.add(
            _RedactedFillWidget(
              style: (configuration ??
                      RedactedConfiguration(style: ShimmerStyle()))
                  .style,
              color: style?.color,
              child: Container(
                margin: boxes.indexOf(box) != boxes.length
                    ? const EdgeInsets.only(bottom: 4)
                    : null,
                width: box.right,
                height: box.bottom - box.top,
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        );
      },
    );
  }
}

extension RedactedColumn on Column {
  Column redact(BuildContext context, {RedactedConfiguration? configuration}) {
    List<Widget> newChildren = [];
    for (var child in children) {
      newChildren.add(child.redacted(
        context: context,
        redact: true,
        configuration: configuration,
      ));
    }

    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      key: key,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: newChildren,
    );
  }
}

extension RedactedRow on Row {
  Row redact(BuildContext context, {RedactedConfiguration? configuration}) {
    List<Widget> newChildren = [];
    for (var child in children) {
      newChildren.add(child.redacted(
        context: context,
        redact: true,
        configuration: configuration,
      ));
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      key: key,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: newChildren,
    );
  }
}

extension RedactedStack on Stack {
  Stack redact(BuildContext context, {RedactedConfiguration? configuration}) {
    List<Widget> newChildren = [];
    for (var child in children) {
      newChildren.add(child.redacted(
        context: context,
        redact: true,
        configuration: configuration,
      ));
    }

    return Stack(
      alignment: alignment,
      clipBehavior: clipBehavior,
      fit: fit,
      key: key,
      textDirection: textDirection,
      children: newChildren,
    );
  }
}

extension RedactedWrap on Wrap {
  Wrap redact(BuildContext context, {RedactedConfiguration? configuration}) {
    List<Widget> newChildren = [];
    for (var child in children) {
      newChildren.add(child.redacted(
        context: context,
        redact: true,
        configuration: configuration,
      ));
    }

    return Wrap(
      crossAxisAlignment: crossAxisAlignment,
      alignment: alignment,
      direction: direction,
      runAlignment: runAlignment,
      runSpacing: runSpacing,
      spacing: spacing,
      verticalDirection: verticalDirection,
      clipBehavior: clipBehavior,
      key: key,
      textDirection: textDirection,
      children: newChildren,
    );
  }
}

extension RedactedCenter on Center {
  Center redact(BuildContext context, {RedactedConfiguration? configuration}) {
    return Center(
      heightFactor: heightFactor,
      key: key,
      widthFactor: widthFactor,
      child: child?.redacted(
        context: context,
        redact: true,
        configuration: configuration,
      ),
    );
  }
}

extension RedactedSizedbox on SizedBox {
  SizedBox redact(BuildContext context,
      {RedactedConfiguration? configuration}) {
    return SizedBox(
      height: height,
      key: key,
      width: width,
      child: child?.redacted(
        context: context,
        redact: true,
        configuration: configuration,
      ),
    );
  }
}

extension RedactedPadding on Padding {
  Padding redact(BuildContext context, {RedactedConfiguration? configuration}) {
    return Padding(
      padding: padding,
      key: key,
      child: child?.redacted(
        context: context,
        redact: true,
        configuration: configuration,
      ),
    );
  }
}

extension RedactedExpanded on Expanded {
  Expanded redact(BuildContext context,
      {RedactedConfiguration? configuration}) {
    return Expanded(
      flex: flex,
      key: key,
      child: child.redacted(
        context: context,
        redact: true,
        configuration: configuration,
      ),
    );
  }
}

extension RedactedAspectRatio on AspectRatio {
  AspectRatio redact(BuildContext context,
      {RedactedConfiguration? configuration}) {
    return AspectRatio(
      key: key,
      aspectRatio: aspectRatio,
      child: child?.redacted(
          context: context, redact: true, configuration: configuration),
    );
  }
}

extension RedactedImageContainer on Container {
  Widget redact(BuildContext context, {RedactedConfiguration? configuration}) {
    if (child == null) return this;
    if (child.runtimeType != Image) {
      return child!.redacted(
        context: context,
        redact: true,
        configuration: configuration,
      );
    }
    return _RedactedFillWidget(
      style:
          (configuration ?? RedactedConfiguration(style: ShimmerStyle())).style,
      color: color ??
          ((decoration is BoxDecoration)
              ? (decoration as BoxDecoration).color
              : null),
      child: Container(
        margin: margin,
        alignment: alignment,
        constraints: constraints,
        foregroundDecoration: foregroundDecoration,
        key: key,
        padding: padding,
        transform: transform,
        transformAlignment: transformAlignment,
        // child: child,
      ),
    );
  }
}

class _RedactedFillWidget extends StatefulWidget {
  const _RedactedFillWidget({
    required this.child,
    required this.style,
    this.color,
  });
  final Container child;
  final RedactedStyle style;
  final Color? color;

  @override
  State<_RedactedFillWidget> createState() => __RedactedFillWidgetState();
}

class __RedactedFillWidgetState extends State<_RedactedFillWidget> {
  @override
  void initState() {
    if (widget.style is GlowStyle) {
      Future.delayed((widget.style as GlowStyle).duration, () {
        setState(() {
          colored = !colored;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.style is GlowStyle) {
      return _buildGlowWidget();
    } else if (widget.style is ShimmerStyle) {
      return _buildShimmerWidget();
    } else {
      return _buildStaticColor();
    }
  }

  Widget _buildShimmerWidget() {
    return Shimmer.fromColors(
      baseColor: (widget.style as ShimmerStyle).baseColor,
      highlightColor: (widget.style as ShimmerStyle).highlightColor,
      child: Container(
        margin: widget.child.margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: widget.child,
      ),
    );
  }

  bool colored = false;
  Widget _buildGlowWidget() {
    var color = (widget.style as GlowStyle).inheritColor
        ? widget.color ?? (widget.style as GlowStyle).color
        : (widget.style as GlowStyle).color;
    return AnimatedContainer(
      duration: (widget.style as GlowStyle).duration,
      margin: widget.child.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colored ? color.withAlpha(50) : color.withAlpha(200),
      ),
      child: widget.child,
      onEnd: () {
        setState(() {
          colored = !colored;
        });
      },
    );
  }

  Size? size;
  Widget _buildStaticColor() {
    return MeasureSize(
      onChange: (p0) {
        if (size == null) {
          setState(() {
            size = p0;
          });
        }
      },
      child: size == null
          ? widget.child
          : Container(
              margin: widget.child.margin,
              width: size!.width,
              height: size!.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: (widget.style as StaticColorStyle).color,
              ),
            ),
    );
  }
}
