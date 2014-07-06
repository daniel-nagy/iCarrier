ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = iCarrierPreferences
iCarrierPreferences_FILES = iCarrierPreferences.mm
iCarrierPreferences_INSTALL_PATH = /Library/PreferenceBundles
iCarrierPreferences_FRAMEWORKS = UIKit
iCarrierPreferences_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/iCarrierPreferences.plist$(ECHO_END)
