
import 'microphone_info_platform_interface.dart';

class MicrophoneInfo {
  Future<String?> getPlatformVersion() {
    return MicrophoneInfoPlatform.instance.getPlatformVersion();
  }
}
