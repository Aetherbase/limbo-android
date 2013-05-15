LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES :=			\
	gmodule.c    

LOCAL_MODULE := libgmodule-2.0

LOCAL_C_INCLUDES :=			\
	$(LOCAL_PATH)/android-internal	\
	$(GLIB_TOP)/android-internal	\
	$(GLIB_C_INCLUDES)

LOCAL_CFLAGS :=				\
	-DHAVE_CONFIG_H			\
	-DG_LOG_DOMAIN=\"GModule\"	\
	-DG_DISABLE_DEPRECATED 

LOCAL_CFLAGS += $(ARCH_CFLAGS)
LOCAL_ARM_MODE := $(ARM_MODE)

ifeq ($(GLIB_BUILD_STATIC),true)
include $(BUILD_STATIC_LIBRARY)
else
LOCAL_SHARED_LIBRARIES := libglib-2.0

LOCAL_LDLIBS :=				\
	-ldl

include $(BUILD_SHARED_LIBRARY)
endif
