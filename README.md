# External

**external** includes rendering libraries, internet access, memory interaction, library loading, value obfuscation, and much more.

## Features

- Support Android 5.0 - 14 (API level 21 - 34).
- Support armeabi-v7a, arm64-v8a, x86 and x86_64.
- Support mod for some libraries for better performance.

## Setup

Install the latest version of git and android ndk (sdk) for your operating system and use the following commands:

```bash
git clone https://github.com/ssstylish/external.git

cd external
git submodule update --init --recursive

cd zygisk-module-sample/module/jni/libcxx
git pull origin master

cd ../../../../curl-android/curl/src/main/native
git apply ../../../../../patches/curl-android-module.patch

cd curl/src
git apply ../../../../../../../patches/curl-android-tool_hugehelp.patch
git mv tool_hugehelp.c.cvs tool_hugehelp.c

cd ../../nghttp2/lib/includes/nghttp2
git apply ../../../../../../../../../patches/curl-android-nghttp2ver.patch
git mv nghttp2ver.h.in nghttp2ver.h

cd ../../../../ngtcp2/lib/includes/ngtcp2
git apply ../../../../../../../../../patches/curl-android-ngtcp2ver.patch
git mv version.h.in version.h

cd ../../../../nghttp3/lib/includes/nghttp3
git apply ../../../../../../../../../patches/curl-android-nghttp3ver.patch
git mv version.h.in version.h

cd ../../../../../../../../../BoringSSL_Android/boringssl/src/main/native
git apply ../../../../../patches/boringssl_android-module.patch

cd ../../../../../KittyMemory/KittyMemory
git apply ../../patches/kittymemory-header.patch
git apply ../../patches/kittymemory-source.patch

cd ../../And64InlineHook
git apply ../patches/and64inlinehook-source.patch

cd ../substrate
git apply ../patches/substrate-cydiasubstrate.patch
git apply ../patches/substrate-hooker.patch
git apply ../patches/substrate-posixmemory.patch
git apply ../patches/substrate-buffer.patch
```

## Usage

> Android.mk

```
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE           := test
LOCAL_SRC_FILES        := test.cpp
LOCAL_STATIC_LIBRARIES := external
include $(BUILD_SHARED_LIBRARY)

include $(LOCAL_PATH)/external/Android.mk
```

> Application.mk
```
APP_ABI      := all
APP_STL      := none
APP_OPTIM    := release
APP_PLATFORM := android-21
```

> test.cpp
```cpp
#include "curl/curl.h"
#include "nlohmann/json.hpp"
#include "imgui_impl_android.h"
//etc...
```
