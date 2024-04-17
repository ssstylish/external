LOCAL_PATH              := $(call my-dir)

include $(LOCAL_PATH)/Sources.mk
include $(CLEAR_VARS)

LOCAL_SRC_FILES         :=               \
	$(XDL_PATH)/xdl.c                    \
	$(XDL_PATH)/xdl_util.c               \
	$(XDL_PATH)/xdl_lzma.c               \
	$(XDL_PATH)/xdl_linker.c             \
	$(XDL_PATH)/xdl_iterate.c            \
	$(OXORANY_PATH)/oxorany.cpp          \
	$(KITTY_PATH)/KittyArm64.cpp         \
	$(KITTY_PATH)/KittyUtils.cpp         \
	$(KITTY_PATH)/MemoryPatch.cpp        \
	$(KITTY_PATH)/KittyMemory.cpp        \
	$(KITTY_PATH)/KittyScanner.cpp       \
	$(KITTY_PATH)/MemoryBackup.cpp       \
	$(IMGUI_PATH)/\\\\\\\imgui.cpp       \
	$(IMGUI_PATH)/\\imgui_demo.cpp       \
	$(IMGUI_PATH)/\\imgui_draw.cpp       \
	$(IMGUI_PATH)/imgui_tables.cpp       \
	$(IMGUI_PATH)/imgui_widgets.cpp      \
	$(IMGUI_IMPL)/imgui_impl_android.cpp \
	$(IMGUI_IMPL)/imgui_impl_opengl3.cpp
LOCAL_C_INCLUDES        :=               \
	$(LOCAL_PATH)/\\\\\\$(IMGUI_PATH)    \
	$(LOCAL_PATH)/\\\\\\$(IMGUI_IMPL)    \
	$(LOCAL_PATH)/\\\\\\$(CYDIA_PATH)    \
	$(LOCAL_PATH)/\\\\\\$(RPROP_PATH)    \
	$(LOCAL_PATH)/\\\\\\$(KITTY_PATH)    \
	$(LOCAL_PATH)/\\\\\$(ZYGISK_PATH)    \
	$(LOCAL_PATH)/\\\\$(OXORANY_PATH)    \
	$(LOCAL_PATH)/\\\$(XDL_PATH)/include \
	$(LOCAL_PATH)/\\$(JSON_PATH)/include \
	$(LOCAL_PATH)/$(CYDIA_HDE64)/include
	ifneq ($(TARGET_ARCH_ABI),arm64-v8a)
LOCAL_SRC_FILES         +=               \
	$(CYDIA_PATH)/\\\\\\\\\\Debug.cpp    \
	$(CYDIA_PATH)/\\\\\\\\\Hooker.cpp    \
	$(CYDIA_HDE64)/\\\\\\\src/hde64.c    \
	$(CYDIA_PATH)/\\\\PosixMemory.cpp
	else
LOCAL_SRC_FILES         +=               \
	$(RPROP_PATH)/And64InlineHook.cpp
	endif
LOCAL_MODULE            := external
LOCAL_CPPFLAGS          := -DkNO_KEYSTONE
LOCAL_STATIC_LIBRARIES  := libcxx curl_static
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES)

include $(BUILD_STATIC_LIBRARY)
include $(LOCAL_PATH)/Modules.mk
