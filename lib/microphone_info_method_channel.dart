import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'microphone_info_platform_interface.dart';

/// An implementation of [MicrophoneInfoPlatform] that uses method channels.
class MethodChannelMicrophoneInfo extends MicrophoneInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('microphone_info');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
