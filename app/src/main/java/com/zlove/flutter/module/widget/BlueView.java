package com.zlove.flutter.module.widget;

import android.content.Context;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;

public class BlueView extends View {

    public BlueView(Context context) {
        super(context);
    }

    public BlueView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public BlueView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        return super.onTouchEvent(event);
    }
}
