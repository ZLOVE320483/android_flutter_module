package com.zlove.flutter.module.flutter;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.view.Gravity;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;

import com.zlove.flutter.module.R;

public class KeyboardDialog extends Dialog {
    Window window;
    public KeyboardDialog(@NonNull Context context) {
        this(context, R.style.input_dialog_style);
    }

    public KeyboardDialog(@NonNull Context context, int themeResId) {
        super(context, themeResId);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.fragment_keyboard_dialog);

        window = getWindow();
        window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        window.setGravity(Gravity.BOTTOM);
        setCanceledOnTouchOutside(true);
    }

    @Override
    public void show() {
        super.show();
    }
}
