package com.zlove.flutter.module;

import android.app.Application;

import com.zlove.flutter.module.flutter.FlutterInitialize;

public class SuperFlutterApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();
        FlutterInitialize.initialize();
    }
}
