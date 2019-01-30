package com.zlove.flutter.module.flutter;

import android.content.Context;
import android.content.Intent;

public class FlutterUtils {

    public static void jumpSettingPage(Context context) {
        openFlutterPage(context, FlutterRouter.PAGE_SETTING);
    }

    public static void jumpLoginPage(Context context) {
        openFlutterPage(context, FlutterRouter.PAGE_LOGIN);
    }

    public static void jumpAnimPage(Context context) {
        openFlutterPage(context, FlutterRouter.PAGE_ANIM);
    }

    public static void jumpBottomSheetPage(Context context) {
        openFlutterPage(context, FlutterRouter.BOTTOM_SHEET);
    }

    public static void jumpListPage(Context context) {
        openFlutterPage(context, FlutterRouter.PAGE_LIST);
    }

    public static void jumpTextFieldPage(Context context) {
        openFlutterPage(context, FlutterRouter.TEXT_FIELD);
    }

    private static void openFlutterPage(Context context, String router) {
        Intent intent = new Intent(context, SuperFlutterActivity.class);
        intent.putExtra(FlutterRouter.ROUTER_KEY, router);
        context.startActivity(intent);
    }

}
