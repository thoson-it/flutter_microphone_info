# microphone_info

A new Flutter plugin to get microphones.

## Getting Started

Add this dependency to `pubspec.yaml` file

```yaml
  microphone_info: ^x.x.x
```

## Using

```dart
///To get microphones
final microphones = MicrophoneInfo().getMicrophones();

///To get default microphone
final defaultMicrophone = MicrophoneInfo().getDefaultMicrophone();
```


