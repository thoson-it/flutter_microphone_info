import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'microphone_info_platform_interface.dart';

/// An implementation of [MicrophoneInfoPlatform] that uses method channels.
class MethodChannelMicrophoneInfo extends MicrophoneInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('microphone_info');

  @override
  Future<List<Object?>?> getMicrophoneInfo() async {
    final microphones =
        await methodChannel.invokeMethod<List<Object?>>('getMicrophoneInfo');
    return microphones;
  }
}
