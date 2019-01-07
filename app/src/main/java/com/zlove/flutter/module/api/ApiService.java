package com.zlove.flutter.module.api;

import com.zlove.flutter.module.bean.UserLoginBean;

import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.POST;
import rx.Observable;

public interface ApiService {

    //-----Login----
    @POST("user/login")
    @FormUrlEncoded
    Observable<UserLoginBean> login(@Field("username") String username, @Field("password") String password);

}
