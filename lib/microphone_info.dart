import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'microphone_info_platform_interface.dart';

enum MicrophoneType {
  typeBuiltinMic, //https://developer.android.com/reference/android/media/AudioDeviceInfo#TYPE_BUILTIN_MIC
  typeWiredHeadset, //https://developer.android.com/reference/android/media/AudioDeviceInfo#TYPE_WIRED_HEADSET
}

extension _MicrophoneTypeExt on MicrophoneType {
  static MicrophoneType? from({required int type}) {
    switch (type) {
      case 15:
        return MicrophoneType.typeBuiltinMic;
      case 3:
        return MicrophoneType.typeWiredHeadset;
      default:
        return null;
    }
  }
}

class Microphone {
  int id;
  MicrophoneType type;

  Microphone({
    required this.id,
    required this.type,
  });
}

class MicrophoneInfo {
  Future<List<Microphone>> getMicrophones() async {
    final microphone =
        await MicrophoneInfoPlatform.instance.getMicrophoneInfo();
    final result = <Microphone>[];
    microphone?.forEach((element) {
      try {
        final data = jsonDecode(jsonEncode(element));
        final type = _MicrophoneTypeExt.from(type: data['type']);
        if (type != null) {
          result.add(Microphone(
            id: data['id'],
            type: type,
          ));
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    return result;
  }

  Future<Microphone?> getDefaultMicrophone() async {
    final mics = await getMicrophones();
    for (var element in mics) {
      if (element.type == MicrophoneType.typeWiredHeadset) {
        return element;
      }
    }
    if (mics.isNotEmpty) {
      return mics.first;
    } else {
      return null;
    }
  }
}
