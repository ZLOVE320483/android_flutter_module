package com.zlove.flutter.module.flutter;

import android.graphics.Bitmap;
import android.support.annotation.Nullable;
import android.util.Log;

import com.bytedance.imageloader.ImageLoaderPlugin;
import com.facebook.common.executors.CallerThreadExecutor;
import com.facebook.common.references.CloseableReference;
import com.facebook.datasource.DataSource;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.imagepipeline.core.ImagePipeline;
import com.facebook.imagepipeline.datasource.BaseBitmapDataSubscriber;
import com.facebook.imagepipeline.image.CloseableImage;
import com.facebook.imagepipeline.request.ImageRequest;

import java.io.ByteArrayOutputStream;

public class ImageLoaderHelper {

    Object object;

    public void initImageLoader() {
        Log.d("flutter", "--- initImageLoader ---");
        ImageLoaderPlugin.init((context, url) -> {
            ImageRequest imageRequest = ImageRequest.fromUri(url);
            ImagePipeline imagePipeline = Fresco.getImagePipeline();
            DataSource<CloseableReference<CloseableImage>>
                    dataSource = imagePipeline.fetchDecodedImage(imageRequest, null);
            dataSource.subscribe(new BaseBitmapDataSubscriber() {
                @Override
                protected void onNewResultImpl(@Nullable Bitmap bitmap) {
                    if (bitmap == null) {
                        Log.d("flutter", "--- bitmap is null ---");
                        return;
                    }
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    bitmap.compress(Bitmap.CompressFormat.JPEG, 100, baos);
                    object = baos.toByteArray();

                    Log.d("flutter", "---object ---" + object);

                }

                @Override
                protected void onFailureImpl(DataSource<CloseableReference<CloseableImage>> dataSource) {
                    object = null;
                    Log.d("flutter", "---onFailureImpl ---");
                }
            }, CallerThreadExecutor.getInstance());
            return object;
        });
    }
}
