package com.zlove.flutter.module;

import com.facebook.cache.disk.DiskCacheConfig;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.imagepipeline.core.ImagePipelineConfig;
import com.zlove.flutter.module.flutter.FlutterInitialize;

import io.flutter.app.FlutterApplication;

public class SuperFlutterApplication extends FlutterApplication {

    private static SuperFlutterApplication instance;

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;
        frescoInit();
        FlutterInitialize.initialize();
    }

    public static SuperFlutterApplication getInstance() {
        return instance;
    }

    private void frescoInit() {
        ImagePipelineConfig.Builder builder = ImagePipelineConfig.newBuilder(this)
                .setMainDiskCacheConfig(DiskCacheConfig.newBuilder(this).build());
        Fresco.initialize(this, builder.build());
    }
}
