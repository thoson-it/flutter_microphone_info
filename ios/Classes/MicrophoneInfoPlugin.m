#import "MicrophoneInfoPlugin.h"
#if __has_include(<microphone_info/microphone_info-Swift.h>)
#import <microphone_info/microphone_info-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "microphone_info-Swift.h"
#endif

@implementation MicrophoneInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMicrophoneInfoPlugin registerWithRegistrar:registrar];
}
@end
