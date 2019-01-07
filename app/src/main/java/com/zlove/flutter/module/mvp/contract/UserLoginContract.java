package com.zlove.flutter.module.mvp.contract;

import com.zlove.flutter.module.bean.UserLoginBean;
import com.zlove.flutter.module.mvp.BaseModel;
import com.zlove.flutter.module.mvp.BasePresenter;
import com.zlove.flutter.module.mvp.BaseView;

import rx.Observable;

public interface UserLoginContract {

    interface Model extends BaseModel {
        Observable<UserLoginBean> login(String userName, String password);
    }

    interface View extends BaseView {
        void loginSuccess(UserLoginBean loginBean);
    }

    abstract class Presenter extends BasePresenter<View, Model> {
        public abstract void login(String userName, String password);
    }
}
