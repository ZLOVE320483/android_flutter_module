package com.zlove.flutter.module.bean;

import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

public class UserLoginBean implements Serializable {

    @SerializedName("status")
    public int status;

    @SerializedName("message")
    public String message;

    @SerializedName("server_time")
    public long serveTime;

    @SerializedName("data")
    public UserLoginData data;

    public static class UserLoginData implements Serializable {
        @SerializedName("user_id")
        public String userId;

        @SerializedName("session_id")
        public String sessionId;

        @SerializedName("gender")
        public String gender;

        @SerializedName("status")
        public String status;

        @SerializedName("email")
        public String email;

        @SerializedName("signature")
        public String signature;

        @SerializedName("birthday")
        public String birthday;

        @SerializedName("avatar")
        public String avatar;

        @SerializedName("realname")
        public String realname;

        @SerializedName("username")
        public String username;

        @Override
        public String toString() {
            return "UserLoginData{" +
                    "userId='" + userId + '\'' +
                    ", sessionId='" + sessionId + '\'' +
                    ", gender='" + gender + '\'' +
                    ", status='" + status + '\'' +
                    ", email='" + email + '\'' +
                    ", signature='" + signature + '\'' +
                    ", birthday='" + birthday + '\'' +
                    ", avatar='" + avatar + '\'' +
                    ", realname='" + realname + '\'' +
                    ", username='" + username + '\'' +
                    '}';
        }
    }

    @Override
    public String toString() {
        return "UserLoginBean{" +
                "status=" + status +
                ", message='" + message + '\'' +
                ", serveTime=" + serveTime +
                ", data=" + data +
                '}';
    }
}
