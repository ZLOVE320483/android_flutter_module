#!/usr/bin/env bash

cd $(dirname $0)
cd ../

echo '编译中...'

if ./gradlew clean && ./gradlew :app:assembleDebug; then
    adb install -r app/build/outputs/apk/debug/app-debug.apk
else
    echo '编译失败...'

fi