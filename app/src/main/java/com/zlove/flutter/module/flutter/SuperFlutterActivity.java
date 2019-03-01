package com.zlove.flutter.module.flutter;

import android.os.Bundle;

import com.zlove.router.FlutterRouteFragmentActivity;

import io.flutter.plugins.GeneratedPluginRegistrant;

public class SuperFlutterActivity extends FlutterRouteFragmentActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        MethodChannelUtils.initMethodChannel(this, getFlutterView());
    }
}
