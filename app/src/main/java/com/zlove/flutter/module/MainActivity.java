package com.zlove.flutter.module;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.TextView;

import com.facebook.drawee.view.SimpleDraweeView;
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

        findViewById(R.id.jump_to_native).setOnClickListener(v ->
            startActivity(new Intent(this, GestureActivity.class))
        );

        findViewById(R.id.jump).setOnClickListener(v ->
             FlutterUtils.jumpToEntrance(this)
        );

        findViewById(R.id.jump_to_login).setOnClickListener(v ->
                FlutterUtils.jumpLoginPage(this)
        );

        findViewById(R.id.jump_to_anim).setOnClickListener(v ->
                FlutterUtils.jumpAnimPage(this)
        );

        findViewById(R.id.jump_to_bottom).setOnClickListener(v ->
                FlutterUtils.jumpBottomSheetPage(this)
        );

        findViewById(R.id.jump_to_list).setOnClickListener(v ->
                FlutterUtils.jumpListPage(this)
        );

        findViewById(R.id.jump_to_text_field).setOnClickListener(v ->
                FlutterUtils.jumpTextFieldPage(this)
        );

        findViewById(R.id.back).setOnClickListener(v -> {
            finish();
        });

        SimpleDraweeView image1 = findViewById(R.id.simple_view);
        image1.setImageURI("http://03.imgmini.eastday.com/mobile/20170826/20170826184926_37bae545acadfeede2fdd1ba914743cb_2.jpeg");
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

    @Override
    public void onBackPressed() {
        super.onBackPressed();
    }
}
