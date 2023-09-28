A package that automatically generate a loading widget from your own widget.
<p style="text-align: center;">
<img src="https://github.com/mhdmoh/redacted/blob/main/screenshots/redacted.gif?raw=true"/>
</p>

# Usage
First, add `redacted` as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  redacted: [Latest-Version]
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

|  Shimmer |  Glow  | Static  |
|----------|--------|---------|
|<img src="https://github.com/mhdmoh/redacted/blob/main/screenshots/shimmer.gif?raw=true"/>|<img src="https://github.com/mhdmoh/redacted/blob/main/screenshots/glow.gif?raw=true"/>|<img src="https://github.com/mhdmoh/redacted/blob/main/screenshots/static.gif?raw=true"/>|


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

### Unredacted
If you have some widget that you want to keep the same for example you have a title and a value and want to keep the title but redact the value then you can do the following:
```dart
SomeWidget()
  .unredacted
```

### Hide
If you want to hide some widget insted of redacting it then you can do the following:
```dart
SomeWidget()
  .hide
```

## Current Limitations
The widgets that are currently supported in this pacakge are:
`Text` , `Column` , `Row` , `Stack` , `Container` , `Align` , `Positioned` , `Wrap` , `Image` , `Center` , `SizedBox` , `Padding` , `Expanded` , `AspectRatio` , `InkWell` and `StatelessWidget`.

More widgets will be added in the future.
