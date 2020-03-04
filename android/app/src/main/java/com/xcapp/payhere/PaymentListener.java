package com.xcapp.payhere;

import android.app.Activity;
import android.content.Intent;

import com.facebook.react.bridge.ActivityEventListener;

import lk.payhere.androidsdk.PHConstants;

public class PaymentListener implements ActivityEventListener {
    @Override
    public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {

//        if (requestCode == PAYHERE_REQUEST && data != null && data.hasExtra(PHConstants.INTENT_EXTRA_RESULT)) {
//            PHResponse<StatusResponse> response = (PHResponse<StatusResponse>) data.getSerializableExtra(PHConstants.INTENT_EXTRA_RESULT);
//            String msg;
//            if (response.isSuccess()) {
//                msg = "Activity result:" + response.getData().toString();
//                Log.d(TAG, msg);
//            } else {
//                msg = "Result:" + response.toString();
//                Log.d(TAG, msg);
 //           }


        }




    @Override
    public void onNewIntent(Intent intent) {

    }
}
