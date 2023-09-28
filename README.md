A package that automatically generate a loading widget from your own widget.
<p style="text-align: center;">
<img src="screenshots/redacted.gif?raw=true"/>
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
<p style="text-align: center;">
<img src="screenshots/shimmer.gif?raw=true"style="width: 20%;"/>
<img src="screenshots/glow.gif?raw=true"style="width: 20%;"/>
<img src="screenshots/static.gif?raw=true"style="width: 20%;"/>
</p>

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