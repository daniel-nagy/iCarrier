#import <Preferences/Preferences.h>

@interface iCarrierPreferencesListController: PSListController @end

@implementation iCarrierPreferencesListController

	- (id)specifiers {
		
		if(!_specifiers) {
			_specifiers = [[self loadSpecifiersFromPlistName:@"iCarrierPreferences" target:self] retain];
		}
		
		return _specifiers;
	}
	
	- (void)getTwitterURL {
		
		if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]]) {
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=danielnagy13"]];
		}
		
		else {
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/danielnagy13"]];
		}
	}

@end
