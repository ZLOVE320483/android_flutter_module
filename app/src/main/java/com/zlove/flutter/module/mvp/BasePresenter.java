package com.zlove.flutter.module.mvp;

public abstract class BasePresenter<V, M> {
    public V mView;
    public M mModel;

    public void setVM(V v, M m) {
        this.mView = v;
        this.mModel = m;
    }
}
