static NSString * const iCarrierPreferencesFile = @"/var/mobile/Library/Preferences/com.danny.iCarrierPreferences.plist";

NSString *carierName   = @"";
BOOL enableCarrierName = YES;

@class SBStatusBarStateAggregator;

@interface SBStatusBarStateAggregator: NSObject
+ (id)sharedInstance;
- (void)_updateServiceItem;
@end

%hook SBStatusBarStateAggregator

- (id)_sbCarrierNameForOperator:(id)arg1 {
  
  NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile: iCarrierPreferencesFile];
  
  if(settings) {
    enableCarrierName = [settings objectForKey: @"toggleSwitch"] ? [[settings objectForKey: @"toggleSwitch"] boolValue] : enableCarrierName;
    carierName = [settings objectForKey: @"carrierName"] ? [settings objectForKey: @"carrierName"] : carierName;
  }
  
  return enableCarrierName ? carierName : %orig;
}

%end

static void upDateCarrierName(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
  [[%c(SBStatusBarStateAggregator) sharedInstance] _updateServiceItem];
}

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, &upDateCarrierName, (CFStringRef)@"preferencesUpdated", NULL, 1);
}
