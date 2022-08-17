import 'package:flutter_test/flutter_test.dart';
import 'package:microphone_info/microphone_info.dart';
import 'package:microphone_info/microphone_info_platform_interface.dart';
import 'package:microphone_info/microphone_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMicrophoneInfoPlatform 
    with MockPlatformInterfaceMixin
    implements MicrophoneInfoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<List<Object?>?> getMicrophoneInfo() {
    // TODO: implement getMicrophoneInfo
    throw UnimplementedError();
  }
}

void main() {
  final MicrophoneInfoPlatform initialPlatform = MicrophoneInfoPlatform.instance;

  test('$MethodChannelMicrophoneInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMicrophoneInfo>());
  });

  test('getPlatformVersion', () async {
    MicrophoneInfo microphoneInfoPlugin = MicrophoneInfo();
    MockMicrophoneInfoPlatform fakePlatform = MockMicrophoneInfoPlatform();
    MicrophoneInfoPlatform.instance = fakePlatform;
  
    expect(await microphoneInfoPlugin.getMicrophoneInfo(), '42');
  });
}
