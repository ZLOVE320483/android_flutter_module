package com.zlove.flutter.module.utils;

import android.content.Context;
import android.content.pm.PackageManager;
import android.telephony.TelephonyManager;

import com.zlove.flutter.module.SuperFlutterApplication;

public class ApplicationUtil {

    public static Context getApplicationContext() {
        return SuperFlutterApplication.getInstance();
    }

    public static String getVerName(Context context) {
        String verName = "";
        try {
            verName = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        return verName;
    }

    public static int getVersionCode(Context context) {
        int verCode = -1;
        try {
            verCode = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        return verCode;
    }

    public static String getMobilePhoneSysVersion() {
        return android.os.Build.VERSION.RELEASE;
    }

    public static String getDeviceId() throws SecurityException {
        TelephonyManager tm = (TelephonyManager) ApplicationUtil.getApplicationContext().getSystemService(Context.TELEPHONY_SERVICE);
        return tm.getDeviceId();
    }
}
