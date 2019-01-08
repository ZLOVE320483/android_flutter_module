package com.zlove.flutter.module;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.TextView;

import com.zlove.flutter.module.flutter.FlutterUtils;

public class MainActivity extends AppCompatActivity {

    private TextView textView;
    int userId;
    String userName;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        textView = findViewById(R.id.text);
        initData();

        findViewById(R.id.jump).setOnClickListener(v ->
             FlutterUtils.jumpSettingPage(this)
        );

        findViewById(R.id.jump_to_login).setOnClickListener(v ->
                FlutterUtils.jumpLoginPage(this)
        );

    }

    private void initData() {
        Intent intent = getIntent();
        if (intent.hasExtra("user_id")) {
            userId = intent.getIntExtra("user_id", 0);
        }
        if (intent.hasExtra("user_name")) {
            userName = intent.getStringExtra("user_name");
        }
        String content = "userId:" + userId + ", userName:" + userName;
        textView.setText(content);
    }
}
