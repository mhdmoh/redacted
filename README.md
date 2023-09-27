# Usage
First, add `redacted` as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  redacted: ^0.0.6
```

Don't forget to `flutter pub get`.

# Example
```dart
SomeWidget()
    .redacted(context: context, redact: true)
```