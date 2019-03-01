package com.zlove.flutter.module;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;

public class GestureActivity extends AppCompatActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_gesture);

        findViewById(R.id.red).setOnClickListener(v -> Log.d("flutter", "----red----"));
        findViewById(R.id.blue).setOnClickListener(v -> Log.d("flutter", "----blue----"));
    }
}
