package com.zlove.flutter.module.mvp;

import com.zlove.flutter.module.bean.UserLoginBean;
import com.zlove.flutter.module.mvp.contract.UserLoginContract;

import rx.Subscriber;

public class UserLoginPresenter extends UserLoginContract.Presenter {

    @Override
    public void login(String userName, String password) {
        mModel.login(userName, password).subscribe(new Subscriber<UserLoginBean>() {
            @Override
            public void onCompleted() {

            }

            @Override
            public void onError(Throwable e) {
                mView.showErrorTip(e.getMessage());
            }

            @Override
            public void onNext(UserLoginBean userLoginBean) {
                mView.loginSuccess(userLoginBean);
            }
        });
    }
}
