package com.zlove.flutter.module;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.util.Log;
import android.widget.EditText;

import com.zlove.flutter.module.bean.UserLoginBean;
import com.zlove.flutter.module.mvp.UserLoginModel;
import com.zlove.flutter.module.mvp.UserLoginPresenter;
import com.zlove.flutter.module.mvp.contract.UserLoginContract;
import com.zlove.flutter.module.utils.MD5Util;

public class LoginActivity extends AppCompatActivity implements UserLoginContract.View {

    private EditText etPhone;
    private EditText etPassword;

    private String phone;
    private String password;

    private UserLoginContract.Presenter presenter;
    private UserLoginContract.Model model;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        etPhone = findViewById(R.id.phone);
        etPassword = findViewById(R.id.password);

        model = new UserLoginModel();
        presenter = new UserLoginPresenter();
        presenter.setVM(this, model);

        findViewById(R.id.login).setOnClickListener(v -> {
            phone = etPhone.getText().toString().trim();
            password = etPassword.getText().toString().trim();

            if (TextUtils.isEmpty(password) || TextUtils.isEmpty(phone)) {
                return;
            }

            presenter.login(phone, MD5Util.getMD5Code(password));
        });
    }

    @Override
    public void loginSuccess(UserLoginBean loginBean) {
        Log.d("ZLOVE", "loginSuccess---" + loginBean.toString());
    }

    @Override
    public void showLoading(String title) {

    }

    @Override
    public void stopLoading() {

    }

    @Override
    public void showErrorTip(String msg) {
        Log.d("ZLOVE", "showErrorTip---" + msg);
    }
}
