import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'microphone_info_method_channel.dart';

abstract class MicrophoneInfoPlatform extends PlatformInterface {
  /// Constructs a MicrophoneInfoPlatform.
  MicrophoneInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static MicrophoneInfoPlatform _instance = MethodChannelMicrophoneInfo();

  /// The default instance of [MicrophoneInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelMicrophoneInfo].
  static MicrophoneInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MicrophoneInfoPlatform] when
  /// they register themselves.
  static set instance(MicrophoneInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<List<Object?>?> getMicrophoneInfo() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
