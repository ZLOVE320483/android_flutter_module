package com.zlove.flutter.module.flutter;

import com.zlove.router.RouterPlugin;

public class FlutterInitialize {

    public static void initialize() {
        initRouter();
    }

    private static void initRouter() {
        RouterPlugin.init((context, openUrl, extraArgs) -> {

        });
    }
}
