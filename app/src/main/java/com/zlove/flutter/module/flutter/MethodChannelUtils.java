package com.zlove.flutter.module.flutter;

import android.support.v4.app.FragmentActivity;
import android.util.Log;
import android.widget.Toast;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.view.FlutterView;

public class MethodChannelUtils {

    private static final String CHANNEL_NAME_COMMON = "common";

    public static void initMethodChannel(FragmentActivity activity, FlutterView flutterView) {
        initCommonMethodChannel(activity, flutterView);
    }

    private static void initCommonMethodChannel(FragmentActivity activity, FlutterView flutterView) {
        new MethodChannel(flutterView, CHANNEL_NAME_COMMON).setMethodCallHandler((call, result) -> {
            switch (call.method) {
                case "finish":
                    activity.finish();
                    break;
                case "showToast":
                    Toast.makeText(activity, (String) call.arguments, Toast.LENGTH_SHORT).show();
                    break;
                case "showKeyboardDialog":
                    KeyboardDialogFragment dialogFragment = new KeyboardDialogFragment();
                    dialogFragment.show(activity.getSupportFragmentManager(), "input");
                    break;
                default:
                    break;
            }
        });

        BasicMessageChannel<Object> messageChannel = new BasicMessageChannel<>(flutterView, "send_message", StandardMessageCodec.INSTANCE);
        messageChannel.send("this is android", o -> Log.d("flutter", "receive message from dart --- " + o));

        messageChannel.setMessageHandler((o, reply) -> {
            Log.d("flutter", "receive message from dart --- " + o);
            reply.reply("this is android");
        });
    }



}
