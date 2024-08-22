/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "android.hardware.gatekeeper@1.0-service-mdfpp"

#include <android-base/logging.h>
#include <android/hardware/gatekeeper/1.0/IGatekeeper.h>
#include <hidl/LegacySupport.h>

// Generated HIDL files
using android::hardware::gatekeeper::V1_0::IGatekeeper;
using android::hardware::gatekeeper::V1_0::implementation::Gatekeeper

int main() {
    ::android::hardware::configureRpcThreadpool(1, true);
    android::sp<IGatekeeper> gatekeeper = new Gatekeeper();
    auto status = gatekeeper->registerAsService("mdfpp");
    if (status != android::OK) {
        LOG(FATAL) << "Could not register mdfpp Gatekeeper service (%d)", status;
    }

    android::hardware::joinRpcThreadpool();
    return -1;
}
