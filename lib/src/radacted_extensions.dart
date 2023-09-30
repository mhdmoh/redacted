import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:measure_size/measure_size.dart';
import 'package:redacted/src/redacted_configuration.dart';
import 'package:redacted/src/redacted_widget.dart';

extension RedactedText on Text {
  Widget redact({RedactedConfiguration? configuration}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var text = data ?? "";
        if (text.isEmpty) {
          if ((configuration ?? RedactedConfiguration()).autoFillTexts) {
            text = (configuration ?? RedactedConfiguration()).autoFillText;
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
              configuration: configuration ?? RedactedConfiguration(),
              child: Container(
                margin: boxes.indexOf(box) != boxes.length
                    ? EdgeInsets.only(
                        bottom: boxes.isNotEmpty &&
                                boxes.indexOf(box) - 1 != boxes.length
                            ? 2
                            : 0)
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

extension RedactedIcon on Icon {
  Widget redact() {
    return Opacity(opacity: 0, child: this);
  }
}

extension RedactedImageContainer on Container {
  Widget redact(BuildContext context, {RedactedConfiguration? configuration}) {
    if (child == null) return this;
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: _RedactedFillWidget(
        configuration: configuration ?? RedactedConfiguration(),
        child: Container(
          decoration: (decoration is BoxDecoration)
              ? BoxDecoration(
                  borderRadius: (decoration as BoxDecoration).borderRadius,
                  shape: (decoration as BoxDecoration).shape,
                )
              : decoration,
          clipBehavior: clipBehavior,
          alignment: alignment,
          constraints: constraints,
          foregroundDecoration: foregroundDecoration,
          key: key,
          padding: padding,
          transform: transform,
          transformAlignment: transformAlignment,
          child: child is Icon ||
                  child is Image ||
                  child is SvgPicture ||
                  child is Text
              ? null
              : child!.redacted(
                  context: context,
                  redact: true,
                  configuration: configuration,
                ),
        ),
      ),
    );
  }
}

extension RedactedAlig on Align {
  Align redact(BuildContext context, {RedactedConfiguration? configuration}) {
    return Align(
      alignment: alignment,
      heightFactor: heightFactor,
      key: key,
      widthFactor: widthFactor,
      child: child?.redacted(
          context: context, redact: true, configuration: configuration),
    );
  }
}

extension RedactedPositioned on Positioned {
  Positioned redact(BuildContext context,
      {RedactedConfiguration? configuration}) {
    return Positioned(
      key: key,
      bottom: bottom,
      height: height,
      left: left,
      right: right,
      top: top,
      width: width,
      child: child.redacted(
          context: context, redact: true, configuration: configuration),
    );
  }
}

extension RedactedImage on Image {
  Widget redact({RedactedConfiguration? configuration}) {
    return MeasuredWidget(
      configuration: configuration ?? RedactedConfiguration(),
      onSizeLoaded: (size) {
        return Container(
          padding: EdgeInsets.zero,
          width: size.width,
          height: size.height,
        );
      },
      child: this,
    );
  }
}

extension RedactedInkWell on InkWell {
  InkWell redact(BuildContext context, {RedactedConfiguration? configuration}) {
    return InkWell(
      autofocus: autofocus,
      borderRadius: borderRadius,
      canRequestFocus: canRequestFocus,
      customBorder: customBorder,
      enableFeedback: enableFeedback,
      excludeFromSemantics: excludeFromSemantics,
      focusColor: focusColor,
      focusNode: focusNode,
      highlightColor: highlightColor,
      hoverColor: hoverColor,
      key: key,
      mouseCursor: mouseCursor,
      onDoubleTap: onDoubleTap,
      onFocusChange: onFocusChange,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      onLongPress: onLongPress,
      onSecondaryTap: onSecondaryTap,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      overlayColor: overlayColor,
      radius: radius,
      splashColor: splashColor,
      splashFactory: splashFactory,
      statesController: statesController,
      child: child?.redacted(
          context: context, redact: true, configuration: configuration),
    );
  }
}

class _RedactedFillWidget extends StatefulWidget {
  const _RedactedFillWidget({
    required this.child,
    required this.configuration,
  });
  final Container child;
  final RedactedConfiguration configuration;
  @override
  State<_RedactedFillWidget> createState() => __RedactedFillWidgetState();
}

class __RedactedFillWidgetState extends State<_RedactedFillWidget> {
  @override
  void initState() {
    Future.delayed(widget.configuration.animationDuration, () {
      setState(() {
        colored = !colored;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildGlowWidget();
  }

  bool colored = false;
  Widget _buildGlowWidget() {
    var color = widget.configuration.redactedColor;

    return AnimatedContainer(
      duration: widget.configuration.animationDuration,
      margin: widget.child.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colored ? color!.withAlpha(50) : color!.withAlpha(200),
      ),
      child: widget.child,
      onEnd: () {
        setState(() {
          colored = !colored;
        });
      },
    );
  }
}

class MeasuredWidget extends StatefulWidget {
  const MeasuredWidget({
    super.key,
    required this.child,
    required this.onSizeLoaded,
    required this.configuration,
  });

  final Widget Function(Size size) onSizeLoaded;
  final Widget child;
  final RedactedConfiguration configuration;

  @override
  State<MeasuredWidget> createState() => _MeasuredWidgetState();
}

class _MeasuredWidgetState extends State<MeasuredWidget> {
  Size? size;
  Container? newChild;

  @override
  Widget build(BuildContext context) {
    return MeasureSize(
      onChange: (newSize) {
        if (size == null && newSize != Size.zero) {
          setState(() {
            size = newSize;
            newChild = widget.onSizeLoaded(newSize) as Container;
          });
        }
      },
      child: newChild == null
          ? Opacity(opacity: 0, child: widget.child)
          : _RedactedFillWidget(
              configuration: widget.configuration, child: newChild!),
    );
  }
}
