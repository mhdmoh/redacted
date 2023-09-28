A package that automatically generate a loading widget from your own widget.
<p style="text-align: center;">
<img src="https://github.com/mhdmoh/redacted/blob/main/screenshots/redacted.gif?raw=true"/>
</p>
# Usage
First, add `redacted` as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  redacted: ^0.0.6
```

Don't forget to `flutter pub get`.

# Example
```dart
ShoeWidget()
    .redacted(context: context, redact: true)
```

## Styling
There is three styles you can choose from:
`ShimmerStyle`, `GlowStyle` and `StaticColorStyle`
<div style="display: flex;">
<img src="https://github.com/mhdmoh/redacted/blob/main/screenshots/shimmer.gif?raw=true"  style="max-width: 25%;"/>
<img src="https://github.com/mhdmoh/redacted/blob/main/screenshots/glow.gif?raw=true"  style="max-width: 25%;"/>
<img src="https://github.com/mhdmoh/redacted/blob/main/screenshots/static.gif?raw=true"  style="max-width: 25%;"/>
</div>

you can set the style like this:
```dart
ShoeWidget().redacted(
  context: context,
  redact: true,
  configuration: RedactedConfiguration(
    style: GlowStyle(
      color: Colors.grey, //default
      duration: const Duration(milliseconds: 800), //default
      inheritColor: false, //default
    ),
  ),
)
```

## Current Limitations
The current widgets that are currently supported in the pacakge are:
`Text` , `Column` , `Row` , `Stack` , `Container` , `Wrap` , `Center` , `SizedBox` , `Padding` , `Expanded` , `AspectRatio` , `InkWell` and `StatelessWidget`.

More widgets will be added in the future.
