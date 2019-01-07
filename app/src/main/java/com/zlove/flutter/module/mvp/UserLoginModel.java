package com.zlove.flutter.module.mvp;

import com.zlove.flutter.module.api.Api;
import com.zlove.flutter.module.bean.UserLoginBean;
import com.zlove.flutter.module.mvp.contract.UserLoginContract;

import rx.Observable;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;

public class UserLoginModel implements UserLoginContract.Model {

    @Override
    public Observable<UserLoginBean> login(String userName, String password) {
        return Api.getDefault().login(userName, password).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread());
    }
}
