package com.zlove.flutter.module.flutter;

import android.content.Context;
import android.content.Intent;

public class FlutterUtils {

    public static void jumpSettingPage(Context context) {
        openFlutterPage(context, FlutterRouter.PAGE_SETTING);
    }

    private static void openFlutterPage(Context context, String router) {
        Intent intent = new Intent(context, SuperFlutterActivity.class);
        intent.putExtra(FlutterRouter.ROUTER_KEY, router);
        context.startActivity(intent);
    }

}
