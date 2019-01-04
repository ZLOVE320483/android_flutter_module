package com.zlove.flutter.module;

import com.zlove.flutter.module.flutter.FlutterInitialize;

import io.flutter.app.FlutterApplication;

public class SuperFlutterApplication extends FlutterApplication {

    @Override
    public void onCreate() {
        super.onCreate();
        FlutterInitialize.initialize();
    }
}
