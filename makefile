# The original zip file, MUST be specified by each product
local-zip-file     := stockrom.zip

local-out-zip-file := MIUI_z2_plus.zip

local-modified-jars := org.cyanogenmod.platform
local-miui-removed-apps := FM
local-miui-modified-apps := TeleService InCallUI
local-density := XXHDPI

local-phone-apps := PrintSpooler PacProcessor CertInstaller KeyChain \
	Stk UserDictionaryProvider Bluetooth BluetoothMidiService \
	webview telresources WAPPushManager PicoTts\

local-phone-priv-apps := Shell FusedLocation ProxyHandler ExternalStorageProvider Tag \
	SharedStorageBackup InputDevices CellBroadcastReceiver BackupRestoreConfirmation \
	CMSettingsProvider CMAudioService ThemesProvider\

# The certificate for release version
local-certificate-dir := security

local-target-bit := 64

local-pre-zip := local-pre-zip-misc
local-after-zip:= local-put-to-phone

include $(PORT_BUILD)/porting.mk

local-pre-zip-misc:
	cp -rf other/system $(ZIP_DIR)/
	rm -rf $(ZIP_DIR)/system/bin/app_process32_vendor
	cp -rf stockrom/system/bin/app_process32 $(ZIP_DIR)/system/bin/app_process32
	rm -rf $(ZIP_DIR)/system/bin/app_process64_vendor
	cp -rf stockrom/system/bin/app_process64 $(ZIP_DIR)/system/bin/app_process64
	rm -rf $(ZIP_DIR)/system/etc/permissions/org.cyanogenmod.livedisplay.xml
