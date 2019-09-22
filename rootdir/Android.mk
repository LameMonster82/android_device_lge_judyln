LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.judyln.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.judyln.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)
