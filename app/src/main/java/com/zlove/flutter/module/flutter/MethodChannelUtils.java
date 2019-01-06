package com.zlove.flutter.module.flutter;

import android.app.Activity;
import android.widget.Toast;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.FlutterView;

public class MethodChannelUtils {

    private static final String CHANNEL_NAME_COMMON = "common";

    public static void initMethodChannel(Activity activity, FlutterView flutterView) {
        initCommonMethodChannel(activity, flutterView);
    }

    private static void initCommonMethodChannel(Activity activity, FlutterView flutterView) {
        new MethodChannel(flutterView, CHANNEL_NAME_COMMON).setMethodCallHandler((call, result) -> {
            switch (call.method) {
                case "finish":
                    activity.finish();
                    break;
                case "showToast":
                    Toast.makeText(activity, (String) call.arguments, Toast.LENGTH_SHORT).show();
                    break;
                default:
                    break;
            }
        });
    }

}
