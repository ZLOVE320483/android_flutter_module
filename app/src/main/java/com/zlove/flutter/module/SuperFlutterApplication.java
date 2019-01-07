package com.zlove.flutter.module;

import com.zlove.flutter.module.flutter.FlutterInitialize;

import io.flutter.app.FlutterApplication;

public class SuperFlutterApplication extends FlutterApplication {

    private static SuperFlutterApplication instance;

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;
        FlutterInitialize.initialize();
    }

    public static SuperFlutterApplication getInstance() {
        return instance;
    }
}
