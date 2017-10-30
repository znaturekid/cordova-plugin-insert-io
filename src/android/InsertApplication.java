package com.cordova.insert.plugin;
import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.app.Application;
import android.util.Log;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import static sdk.insert.io.Insert.initSDK;

/**
 * Created by hieumai on 10/25/17.
 */

public class InsertApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        ApplicationInfo appliInfo = null;
        try {
            appliInfo = getPackageManager().getApplicationInfo(getPackageName(), PackageManager.GET_META_DATA);
            String API_KEY = appliInfo.metaData.getString("com.cordova.insert.plugin.Insert.API_KEY");
            String COMPANY_NAME = appliInfo.metaData.getString("com.cordova.insert.plugin.Insert.COMPANY_NAME");
            initSDK(this, API_KEY, COMPANY_NAME, null);
        } catch (PackageManager.NameNotFoundException e) {}
    }
}
