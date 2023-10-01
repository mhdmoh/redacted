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
You can change the color and the duration of the animation by using `RedactedConfiguration`:

```dart
ShoeWidget().redacted(
  context: context,
  redact: true,
  configuration: RedactedConfiguration(
    animationDuration : const Duration(milliseconds: 800), //default
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
If you want to hide some widget instead of redacting it then you can do the following:
```dart
SomeWidget()
  .hide
```

## Current Limitations
The widgets that are currently supported in this pacakge are:
`Text` , `Column` , `Row` , `Stack` , `Container` , `Align` , `Positioned` , `Wrap` , `Image` , `Center` , `SizedBox` , `Padding` , `Expanded` , `AspectRatio` , `InkWell` and `StatelessWidget`.

More widgets will be added in the future.
