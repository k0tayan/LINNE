TARGET = iphone:11.4:9.2
ARCHS = armv7 arm64
THEOS_DEVICE_IP = 192.168.11.7
THEOS_DEVICE_PORT = 22
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LINNE
LINNE_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 LINE"
