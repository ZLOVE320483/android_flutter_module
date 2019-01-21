package com.zlove.flutter.module.flutter;

import android.content.Context;
import android.content.Intent;

import com.zlove.flutter.module.MainActivity;
import com.zlove.router.RouterPlugin;

import java.util.Map;

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

    @SuppressWarnings("unchecked")
    private static void jumpNativeActivity(Context context, String openUrl, Object extraArgs) {
       switch (openUrl) {
           case "com.zlove.flutter.module.MainActivity":
               Map<String, Object> args = (Map<String, Object>) extraArgs;
               Intent intent = new Intent(context, MainActivity.class);
               context.startActivity(intent);
               break;
       }
    }
}
