#import "BaseFlutterAppPlugin.h"
#if __has_include(<base_flutter_app/base_flutter_app-Swift.h>)
#import <base_flutter_app/base_flutter_app-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "base_flutter_app-Swift.h"
#endif

@implementation BaseFlutterAppPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBaseFlutterAppPlugin registerWithRegistrar:registrar];
}
@end
