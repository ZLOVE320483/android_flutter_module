package com.zlove.flutter.module.flutter;

import android.content.Context;
import android.content.Intent;

import com.zlove.router.RouterPlugin;

public class FlutterInitialize {

    public static void initialize() {
        initRouter();
    }

    private static void initRouter() {
        RouterPlugin.init((context, openUrl, extraArgs) -> {
            try {
                if (openUrl.startsWith(FlutterRouter.ROUTER_PREFIX)) {
                    Intent intent = new Intent(context, SuperFlutterActivity.class);
                    intent.putExtra(FlutterRouter.ROUTER_KEY, openUrl.substring(FlutterRouter.ROUTER_PREFIX.length()));
                    context.startActivity(intent);
                } else {
                    jumpNativeActivity(context, openUrl, extraArgs);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    private static void jumpNativeActivity(Context context, String name, Object extraArgs) {

    }
}
