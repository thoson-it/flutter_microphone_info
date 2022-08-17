import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:microphone_info/microphone_info_method_channel.dart';

void main() {
  MethodChannelMicrophoneInfo platform = MethodChannelMicrophoneInfo();
  const MethodChannel channel = MethodChannel('microphone_info');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
